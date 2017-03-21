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
    
    final func bringToFront(view:VDrawProjectCanvasView)
    {
        controller.viewProject.viewScroll.viewCanvas.bringSubview(
            toFront:view)
    }
    
    final func beganEditing(touch:UITouch)
    {
        guard
            
            let canvasView:VDrawProjectCanvasView = touch.view as? VDrawProjectCanvasView
            
        else
        {
            return
        }
        
        if let viewNode:VDrawProjectCanvasNode = canvasView as? VDrawProjectCanvasNode
        {
            controller.editNode(editingView:viewNode)
            bringToFront(view:viewNode)
        }
        else if let viewLabel:VDrawProjectCanvasLabel = canvasView as? VDrawProjectCanvasLabel
        {
            controller.editLabel(editingView:viewLabel)
            bringToFront(view:viewLabel)
        }
        else if let viewLink:VDrawProjectCanvasLink = canvasView as? VDrawProjectCanvasLink
        {
            controller.editLink(editingView:viewLink)
        }
    }
    
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
