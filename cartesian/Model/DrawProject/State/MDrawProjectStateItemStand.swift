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
            
            let canvasView:VDrawProjectCanvasView = touch.view as? VDrawProjectCanvasView
        
        else
        {
            return
        }
        
        controller.viewProject.viewScroll.viewCanvas.bringSubview(
            toFront:canvasView)
        
        if let viewNode:VDrawProjectCanvasNode = canvasView as? VDrawProjectCanvasNode
        {
            controller.editNode(editingNode:viewNode)
        }
        else if let viewLabel:VDrawProjectCanvasLabel = canvasView as? VDrawProjectCanvasLabel
        {
            controller.editLabel(editingLabel:viewLabel)
        }
    }
}
