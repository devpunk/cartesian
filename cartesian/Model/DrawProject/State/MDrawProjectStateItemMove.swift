import UIKit

class MDrawProjectStateItemMove:MDrawProjectStateItem
{
    private(set) var movingView:VDrawProjectCanvasView?
    private(set) var deltaX:CGFloat?
    private(set) var deltaY:CGFloat?
    private let kScrollEnabled:Bool = true
    
    init(controller:CDrawProject)
    {
        super.init(
            controller:controller,
            scrollEnabled:kScrollEnabled)
    }
    
    override func touchBegan(touch:UITouch)
    {
        guard
            
            let view:VDrawProjectCanvasView = touch.view as? VDrawProjectCanvasView
        
        else
        {
            return
        }
        
        let touchPoint:CGPoint = touch.location(
            in:controller.viewProject.viewScroll.viewCanvas)
        
        if let model:DNode = view.viewSpatial.model as? DNode
        {
            let modelX:CGFloat = CGFloat(model.centerX)
            let modelY:CGFloat = CGFloat(model.centerY)
            
            deltaX = modelX - touchPoint.x
            deltaY = modelY - touchPoint.y
        }
        else if let model:DLabel = view.viewSpatial.model as? DLabel
        {
            let modelX:CGFloat = CGFloat(model.centerX)
            let modelY:CGFloat = CGFloat(model.centerY)
            
            deltaX = modelX - touchPoint.x
            deltaY = modelY - touchPoint.y
        }
        
        controller.viewProject.viewScroll.viewCanvas.bringSubview(
            toFront:view)
        controller.viewProject.viewScroll.isScrollEnabled = false
        movingView = view
        view.startEditing()
    }
    
    override func touchMoved(touch:UITouch)
    {
        guard
            
            let movingView:VDrawProjectCanvasView = self.movingView,
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
        
        if let movingModel:DNode = movingView.viewSpatial.model as? DNode
        {
            movingModel.centerX = pointX
            movingModel.centerY = pointY
            movingModel.notifyDraw()
        }
        else if let movingModel:DLabel = movingView.viewSpatial.model as? DLabel
        {
            movingModel.centerX = pointX
            movingModel.centerY = pointY
            movingModel.notifyDraw()
        }
    }
    
    override func touchFinished()
    {
        guard
            
            let movingView:VDrawProjectCanvasView = self.movingView
            
        else
        {
            return
        }
        
        self.movingView = nil
        controller.viewProject.viewScroll.isScrollEnabled = true
        movingView.stopEditing()
        deltaX = nil
        deltaY = nil
        
        DManager.sharedInstance?.save()
    }
}
