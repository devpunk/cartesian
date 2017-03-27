import UIKit

class VGallery:VView
{
    private weak var controller:CGallery!
    private weak var spinner:VSpinner!
    
    override init(controller:CController)
    {
        super.init(controller:controller)
        self.controller = controller as? CGallery
        
        let spinner:VSpinner = VSpinner()
        self.spinner = spinner
        
        addSubview(spinner)
        
        NSLayoutConstraint.equals(
            view:spinner,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
