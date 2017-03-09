import UIKit

class MDrawProjectMenuStateItem
{
    let bottom:CGFloat
    private(set) weak var controller:CDrawProject!
    
    init(controller:CDrawProject, bottom:CGFloat)
    {
        self.controller = controller
        self.bottom = bottom
    }
}
