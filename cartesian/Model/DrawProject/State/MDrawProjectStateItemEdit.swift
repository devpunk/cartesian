import UIKit

class MDrawProjectStateItemEdit:MDrawProjectStateItem
{
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
