import UIKit

class CGallery:CController
{
    private weak var viewGallery:VGallery!
    
    override func loadView()
    {
        let viewGallery:VGallery = VGallery(controller:self)
        self.viewGallery = viewGallery
        view = viewGallery
    }
}
