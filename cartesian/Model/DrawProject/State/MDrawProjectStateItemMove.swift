import UIKit

class MDrawProjectStateItemMove:MDrawProjectStateItem
{
    private(set) var movingNode:VDrawProjectCanvasNode?
    private(set) var deltaX:CGFloat?
    private(set) var deltaY:CGFloat?
    
    override func touchBegan(touch:UITouch, node:VDrawProjectCanvasNode)
    {
        guard
            
            let model:DNode = node.viewSpatial.model
        
        else
        {
            return
        }
        
        controller.viewProject.viewScroll.isScrollEnabled = false
        
        node.startMoving()
        
        let modelX:CGFloat = CGFloat(model.centerX)
        let modelY:CGFloat = CGFloat(model.centerY)
        let touchPoint:CGPoint = touch.location(
            in:controller.viewProject.viewScroll.viewCanvas)
        
        deltaX = modelX - touchPoint.x
        deltaY = modelY - touchPoint.y
        movingNode = node
    }
}
