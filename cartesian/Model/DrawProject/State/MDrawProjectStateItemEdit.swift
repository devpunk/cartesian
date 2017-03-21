import UIKit

class MDrawProjectStateItemEdit:MDrawProjectStateItem
{
    private let kScrollEnabled:Bool = true
    
    init(controller:CDrawProject)
    {
        super.init(
            controller:controller,
            scrollEnabled:kScrollEnabled)
    }
    
    override func touchBegan(touch:UITouch)
    {
        beganEditing(touch:touch)
    }
}
