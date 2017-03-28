import UIKit

class MGalleryItemImageStateStandLoading:MGalleryItemImageState
{
    override init(modelImage:MGalleryItemImage)
    {
        super.init(modelImage:modelImage)
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.fetchImage()
        }
    }
    
    //MARK: private
    
    private func fetchImage()
    {
        guard
            
            let galleryItemId:String = modelImage?.galleryItemId
        
        else
        {
            return
        }
        
        let folder:String = FStorage.Folder.gallery.rawValue
        let path:String = "\(folder)/\(galleryItemId)"
        
        FMain.sharedInstance.storage.loadData(
            path:path)
        { (data:Data?, error:Error?) in
            
            if error == nil
            {
                guard
                
                    let dataImage:Data = data,
                    let image:UIImage = UIImage(data:dataImage)
                
                else
                {
                    return
                }
                
                DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
                { [weak self] in
                    
                    self?.modelImage?.imageLoaded(image:image)
                }
            }
        }
    }
}
