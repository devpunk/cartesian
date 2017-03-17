import UIKit

class MDrawProjectStateItem
{
    private(set) weak var controller:CDrawProject!
    let scrollEnabled:Bool
    
    init(
        controller:CDrawProject,
        scrollEnabled:Bool)
    {
        self.controller = controller
        self.scrollEnabled = scrollEnabled
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
