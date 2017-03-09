import UIKit

class MDrawProjectStateItem
{
    private(set) weak var controller:CDrawProject!
    
    init(controller:CDrawProject)
    {
        self.controller = controller
    }
    
    //MARK: public
    
    func touchBegan(touch:UITouch)
    {
    }
    
    func touchMoved(touch:UITouch)
    {
    }
}
