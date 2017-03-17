import UIKit

class MDrawProjectStateItem
{
    private(set) weak var controller:CDrawProject!
    
    init(
        controller:CDrawProject,
        scrollEnabled:Bool)
    {
        self.controller = controller
        controller.viewProject.viewScroll.isScrollEnabled = scrollEnabled
    }
    
    //MARK: public
    
    func canvasStartDragging(scrollView:UIScrollView)
    {
    }
    
    func touchBegan(touch:UITouch)
    {
    }
    
    func touchMoved(touch:UITouch)
    {
    }
    
    func touchFinished()
    {
    }
}
