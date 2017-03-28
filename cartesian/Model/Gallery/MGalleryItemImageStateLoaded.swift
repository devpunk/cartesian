import UIKit

class MGalleryItemImageStateStandLoaded:MGalleryItemImageState
{
    private let img:UIImage
    
    init(img:UIImage, modelImage:MGalleryItemImage)
    {
        self.img = img
        super.init(modelImage:modelImage)
    }
    
    override func image() -> UIImage?
    {
        return img
    }
}
