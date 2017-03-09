import UIKit

class VDrawProjectCanvas:UIView
{
    private weak var controller:CDrawProject!
    private weak var movingNode:VDrawProjectCanvasNode?
    private var movingDeltaPoint:CGPoint?
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        self.controller = controller
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func touchesBegan(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        guard
        
            let touch:UITouch = touches.first,
            let node:VDrawProjectCanvasNode = touch.view as? VDrawProjectCanvasNode
        
        else
        {
            return
        }
        
        bringSubview(toFront:node)
        controller.modelState.current?.touchBegan(
            touch:touch,
            node:node)
    }
    
    override func touchesMoved(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        guard
        
            let touch:UITouch = touches.first,
            let movingNode:DNode = self.movingNode?.viewSpatial.model,
            let movingDeltaPoint:CGPoint = self.movingDeltaPoint
        
        else
        {
            return
        }
        
        let point:CGPoint = touch.location(in:self)
        let pointX:Float = Float(point.x + movingDeltaPoint.x)
        let pointY:Float = Float(point.y + movingDeltaPoint.y)
        
        movingNode.centerX = pointX
        movingNode.centerY = pointY
        movingNode.notifyDraw()
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        touchFinished()
    }
    
    override func touchesCancelled(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        touchFinished()
    }
    
    //MARK: private
    
    private func touchFinished()
    {
        controller.viewProject.viewScroll.isScrollEnabled = true
        movingNode?.stopMoving()
        movingNode = nil
        movingDeltaPoint = nil
    }
    
    //MARK: public
    
    func stateMoving()
    {
        isUserInteractionEnabled = false
        state = State.moving
        isUserInteractionEnabled = true
    }
    
    func stateStand()
    {
        isUserInteractionEnabled = false
        state = State.stand
        isUserInteractionEnabled = true
    }
    
    func draw()
    {
        for subview:UIView in subviews
        {
            subview.removeFromSuperview()
            
            guard
            
                let node:VDrawProjectCanvasNode = subview as? VDrawProjectCanvasNode
            
            else
            {
                continue
            }
            
            node.endEffect()
        }
        
        guard
        
            let nodes:[DNode] = controller.model?.nodes?.array as? [DNode]
        
        else
        {
            return
        }
        
        for node:DNode in nodes
        {
            let viewNode:VDrawProjectCanvasNode = VDrawProjectCanvasNode(
                controller:controller,
                model:node)
            
            addSubview(viewNode)
            viewNode.centerNode()
        }
    }
}
