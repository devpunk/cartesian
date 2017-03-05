import UIKit

class VDrawProjectMenu:UIView
{
    private weak var controller:CDrawProject!
    private weak var viewBar:VDrawProjectMenuBar!
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
