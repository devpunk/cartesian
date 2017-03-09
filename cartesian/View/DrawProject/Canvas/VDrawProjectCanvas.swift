import UIKit

class VDrawProjectCanvas:UIView
{
    private weak var controller:CDrawProject!
    
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
        
            let touch:UITouch = touches.first
        
        else
        {
            return
        }
        
        controller.modelState.current?.touchBegan(
            touch:touch)
    }
    
    override func touchesMoved(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        guard
        
            let touch:UITouch = touches.first
        
        else
        {
            return
        }
        
        controller.modelState.current?.touchMoved(
            touch:touch)
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        controller.modelState.current?.touchFinished()
    }
    
    override func touchesCancelled(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        controller.modelState.current?.touchFinished()
    }
    
    //MARK: public
    
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
