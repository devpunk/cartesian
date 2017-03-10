import UIKit

class MDrawProjectStateItemMove:MDrawProjectStateItem
{
    private(set) var movingNode:VDrawProjectCanvasNode?
    private(set) var deltaX:CGFloat?
    private(set) var deltaY:CGFloat?
    
    override func touchBegan(touch:UITouch)
    {
        guard
            
            let node:VDrawProjectCanvasNode = touch.view as? VDrawProjectCanvasNode,
            let model:DNode = node.viewSpatial.model
        
        else
        {
            return
        }
        
        controller.viewProject.viewScroll.viewCanvas.bringSubview(toFront:node)
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
    
    override func touchMoved(touch:UITouch)
    {
        guard
            
            let movingNode:DNode = self.movingNode?.viewSpatial.model,
            let deltaX:CGFloat = self.deltaX,
            let deltaY:CGFloat = self.deltaY
            
        else
        {
            return
        }
        
        let point:CGPoint = touch.location(
            in:controller.viewProject.viewScroll.viewCanvas)
        let pointX:Float = Float(point.x + deltaX)
        let pointY:Float = Float(point.y + deltaY)
        
        movingNode.centerX = pointX
        movingNode.centerY = pointY
        movingNode.notifyDraw()
    }
    
    override func touchFinished()
    {
        controller.viewProject.viewScroll.isScrollEnabled = true
        movingNode?.stopMoving()
        movingNode = nil
        deltaX = nil
        deltaY = nil
    }
}