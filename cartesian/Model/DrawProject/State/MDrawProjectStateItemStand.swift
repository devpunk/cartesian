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
            controller.editNode(editingView:viewNode)
        }
        else if let viewLabel:VDrawProjectCanvasLabel = canvasView as? VDrawProjectCanvasLabel
        {
            controller.editLabel(editingView:viewLabel)
        }
    }
}
