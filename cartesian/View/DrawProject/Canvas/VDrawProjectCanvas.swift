import UIKit

class VDrawProjectCanvas:UIView
{
    private weak var controller:CDrawProject!
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.red
        self.controller = controller
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
