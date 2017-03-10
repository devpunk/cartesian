import UIKit

class MDrawProjectStateItemStand:MDrawProjectStateItem
{
    override func canvasStartDragging(scrollView:UIScrollView)
    {
        controller.viewProject.viewMenu.displayNothing()
        controller.modelMenuState.current?.hide()
    }
    
    override func touchBegan(touch:UITouch)
    {
        guard
            
            let node:VDrawProjectCanvasNode = touch.view as? VDrawProjectCanvasNode
        
        else
        {
            return
        }
        
        controller.viewProject.viewScroll.viewCanvas.bringSubview(toFront:node)
        controller.editNode(editingNode:node)
    }
}