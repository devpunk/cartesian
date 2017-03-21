import UIKit

class MDrawProjectStateItemText:MDrawProjectStateItem
{
    private let kScrollEnabled:Bool = false
    
    init(controller:CDrawProject)
    {
        super.init(
            controller:controller,
            scrollEnabled:kScrollEnabled)
    }
    
    override func touchBegan(touch:UITouch)
    {
        guard
            
            let canvasView:VDrawProjectCanvasView = touch.view as? VDrawProjectCanvasView
            
        else
        {
            return
        }
        
        controller.viewProject.viewMenu.viewBar.viewText.textField.delegate = nil
        UIApplication.shared.keyWindow!.endEditing(true)
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
