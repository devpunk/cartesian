import UIKit

class VGalleryFooterOther:VGalleryFooter
{
    private weak var buttonLike:UIButton!
    private var liked:Bool
    
    override init(frame:CGRect)
    {
        liked = false
        super.init(frame:frame)
        
        let buttonLike:UIButton = UIButton()
        buttonLike.translatesAutoresizingMaskIntoConstraints = false
        buttonLike.addTarget(
            self,
            action:#selector(actionLike(sender:)),
            for:UIControlEvents.touchUpInside)
        buttonLike.imageView!.contentMode = UIViewContentMode.center
        buttonLike.imageView!.clipsToBounds = true
        buttonLike.imageView!.tintColor = UIColor(white:0, alpha:0.1)
        self.buttonLike = buttonLike
        
        addSubview(buttonLike)
        
        NSLayoutConstraint.topToTop(
            view:buttonLike,
            toView:self,
            constant:kButtonTop)
        NSLayoutConstraint.height(
            view:buttonLike,
            constant:kButtonHeight)
        NSLayoutConstraint.leftToRight(
            view:buttonLike,
            toView:buttonShare)
        NSLayoutConstraint.width(
            view:buttonLike,
            constant:kButtonWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func config(controller:CGallery, model:MGalleryItem)
    {
        super.config(controller:controller, model:model)
        updateLike()
    }
    
    //MARK: actions
    
    func actionLike(sender button:UIButton)
    {
        button.isUserInteractionEnabled = false
        
        guard
        
            let model:MGalleryItem = model
        
        else
        {
            return
        }
        
        if liked
        {
            likeOff()
        }
        else
        {
            likeOn()
        }
        
        controller?.likeItem(model:model)
    }
    
    //MARK: private
    
    private func updateLike()
    {
        buttonLike.isUserInteractionEnabled = true
        
        guard
            
            let galleryItemId:String = model?.image.galleryItemId
            
        else
        {
            return
        }
        
        if let liked:Bool = MSession.sharedInstance.settings?.likedGalleryPost(
            galleryItemId:galleryItemId)
        {
            self.liked = liked
        }
        else
        {
            self.liked = false
        }
        
        if self.liked
        {
            likeOn()
        }
        else
        {
            likeOff()
        }
    }
    
    private func likeOn()
    {
        buttonLike.setImage(
            #imageLiteral(resourceName: "assetGenericLikeOn").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.normal)
        buttonLike.setImage(
            #imageLiteral(resourceName: "assetGenericLikeOn").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.highlighted)
    }
    
    private func likeOff()
    {
        buttonLike.setImage(
            #imageLiteral(resourceName: "assetGenericLikeOff").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.normal)
        buttonLike.setImage(
            #imageLiteral(resourceName: "assetGenericLikeOff").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.highlighted)
    }
}
