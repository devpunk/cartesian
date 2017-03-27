import UIKit

class VGallery:VView
{
    private weak var controller:CGallery!
    
    override init(controller:CController)
    {
        super.init(controller:controller)
        self.controller = controller as? CGallery
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
