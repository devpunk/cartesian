import UIKit

class MGalleryItemImage
{
    let galleryItemId:String
    private(set) var image:UIImage?
    
    init(galleryItemId:String)
    {
        self.galleryItemId = galleryItemId
    }
}
