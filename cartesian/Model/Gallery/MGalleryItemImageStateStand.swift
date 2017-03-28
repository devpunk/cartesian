import UIKit

class MGalleryItemImageStateStand:MGalleryItemImageState
{
    override func image() -> UIImage?
    {
        modelImage?.startLoading()
        
        return nil
    }
}
