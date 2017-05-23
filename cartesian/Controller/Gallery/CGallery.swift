import UIKit
import FirebaseDatabase

class CGallery:CController
{
    let model:MGallery
    private weak var viewGallery:VGallery!
    
    override init()
    {
        model = MGallery()
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func loadView()
    {
        let viewGallery:VGallery = VGallery(controller:self)
        self.viewGallery = viewGallery
        view = viewGallery
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        
        viewGallery.startLoading()
        model.fetchGallery(controller:self)
    }
    
    //MARK: private
    
    private func asyncLikeItem(model:MGalleryItem)
    {
        let galleryItemId:String = model.image.galleryItemId
        
        guard
        
            let liked:Bool = MSession.sharedInstance.settings?.likedGalleryPost(
                galleryItemId:galleryItemId)
        
        else
        {
            return
        }
        
        let path:String = "\(FDb.gallery)/\(galleryItemId)/\(FDbGalleryItem.likes)"
        let deltaLike:Int
        
        if liked
        {
            deltaLike = -1
            model.likes += deltaLike
            
            if let allLikes:[DGalleryLike] = MSession.sharedInstance.settings?.galleryLike?.array as? [DGalleryLike]
            {
                for like:DGalleryLike in allLikes
                {
                    guard
                    
                        let likedItemId:String = like.galleryItemId
                    
                    else
                    {
                        continue
                    }
                    
                    if likedItemId == galleryItemId
                    {
                        DManager.sharedInstance?.delete(data:like)
                        {
                            DManager.sharedInstance?.save
                            { [weak self] in
                                
                                self?.galleryLoaded()
                            }
                        }
                        
                        break
                    }
                }
            }
        }
        else
        {
            deltaLike = 1
            model.likes += deltaLike
            
            DManager.sharedInstance?.createData(
                entityName:DGalleryLike.entityName)
            { (data) in
                
                guard
                
                    let galleryLike:DGalleryLike = data as? DGalleryLike
                
                else
                {
                    return
                }
                
                galleryLike.galleryItemId = galleryItemId
                MSession.sharedInstance.settings?.addToGalleryLike(
                    galleryLike)
                
                DManager.sharedInstance?.save
                { [weak self] in
                    
                    self?.galleryLoaded()
                }
            }
        }
        
        FMain.sharedInstance.db.transaction(
            path:path)
        { (mutableData:MutableData) -> (TransactionResult) in
            
            if let currentLikes:Int = mutableData.value as? Int
            {
                let newLikes:Int = currentLikes + deltaLike
                mutableData.value = newLikes
            }
            else
            {
                if deltaLike > 0
                {
                    mutableData.value = deltaLike
                }
                else
                {
                    mutableData.value = 0
                }
            }
            
            let transationResult:TransactionResult = TransactionResult.success(
                withValue:mutableData)
            
            return transationResult
        }
    }
    
    //MARK: public
    
    func galleryLoaded()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.viewGallery.stopLoading()
        }
    }
    
    func shareItem(model:MGalleryItem)
    {
        guard
        
            let image:UIImage = model.image.state?.image()
        
        else
        {
            return
        }
        
        let activity:UIActivityViewController = UIActivityViewController(
            activityItems:[image],
            applicationActivities:nil)
        
        if let popover:UIPopoverPresentationController = activity.popoverPresentationController
        {
            popover.sourceView = viewGallery
            popover.sourceRect = CGRect.zero
            popover.permittedArrowDirections = UIPopoverArrowDirection.up
        }
        
        present(activity, animated:true)
    }
    
    func likeItem(model:MGalleryItem)
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLikeItem(model:model)
        }
    }
}
