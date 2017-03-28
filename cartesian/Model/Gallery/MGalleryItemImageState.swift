import UIKit

class MGalleryItemImageState
{
    weak var modelImage:MGalleryItemImage?
    
    init(modelImage:MGalleryItemImage)
    {
        self.modelImage = modelImage
    }
    
    //MARK: public
    
    func image() -> UIImage?
    {
        return nil
    }
}
