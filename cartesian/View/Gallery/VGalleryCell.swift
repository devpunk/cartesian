import UIKit

class VGalleryCell:UICollectionViewCell
{
    private weak var imageView:UIImageView!
    private weak var model:MGalleryItem?
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        isUserInteractionEnabled = false
        
        let imageView:UIImageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        self.imageView = imageView
        
        addSubview(imageView)
        
        NSLayoutConstraint.equals(
            view:imageView,
            toView:self)
        
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(notifiedGalleryImageLoaded(sender:)),
            name:Notification.galleryImageLoaded,
            object:nil)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: notified
    
    func notifiedGalleryImageLoaded(sender notification:Notification)
    {
        guard
        
            let modelImage:MGalleryItemImage = notification.object as? MGalleryItemImage,
            let currentImage:MGalleryItemImage = model?.image
        
        else
        {
            return
        }
        
        if modelImage === currentImage
        {
            DispatchQueue.main.async
            { [weak self] in
                
                self?.displayImage()
            }
        }
    }
    
    //MARK: private
    
    private func displayImage()
    {
        imageView.image = model?.image.state?.image()
    }
    
    //MARK: public
    
    func config(model:MGalleryItem)
    {
        self.model = model
        displayImage()
    }
}
