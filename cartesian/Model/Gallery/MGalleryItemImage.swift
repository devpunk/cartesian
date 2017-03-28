import UIKit

class MGalleryItemImage
{
    let galleryItemId:String
    private(set) var state:MGalleryItemImageState?
    
    init(galleryItemId:String)
    {
        self.galleryItemId = galleryItemId
        state = MGalleryItemImageStateStand(modelImage:self)
    }
    
    //MARK: public
    
    func startLoading()
    {
        state = MGalleryItemImageStateStandLoading(modelImage:self)
    }
    
    func imageLoaded(image:UIImage)
    {
        state = MGalleryItemImageStateStandLoaded(
            img:image,
            modelImage:self)
        
        NotificationCenter.default.post(
            name:Notification.galleryImageLoaded,
            object:self)
    }
}
