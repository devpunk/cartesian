import UIKit

class MDrawProjectMenuStateItem
{
    let bottom:CGFloat
    let kAnimationDuration:TimeInterval = 0.3
    private(set) weak var controller:CDrawProject!
    
    init(controller:CDrawProject, bottom:CGFloat)
    {
        self.controller = controller
        self.bottom = bottom
    }
    
    //MARK: public
    
    func show()
    {
    }
    
    func hide()
    {
    }
}
