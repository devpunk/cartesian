import UIKit

class MDrawProjectStateItemStand:MDrawProjectStateItem
{
    private let kScrollEnabled:Bool = true
    
    init(controller:CDrawProject)
    {
        super.init(
            controller:controller,
            scrollEnabled:kScrollEnabled)
    }
    
    override func canvasStartDragging(scrollView:UIScrollView)
    {
        controller.viewProject.viewMenu.displayNothing()
        controller.modelMenuState.current?.hide()
    }
    
    override func touchBegan(touch:UITouch)
    {
        beganEditing(touch:touch)
    }
}
