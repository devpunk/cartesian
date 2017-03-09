import UIKit

class VDrawProjectCanvas:UIView
{
    private enum State
    {
        case stand
        case moving
    }
    
    private weak var controller:CDrawProject!
    private var state:State
    
    init(controller:CDrawProject)
    {
        state = State.stand
        
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
        controller.editNode(editingNode:node)
    }
    
    //MARK: public
    
    func stateMoving()
    {
        state = State.moving
    }
    
    func stateStand()
    {
        state = State.stand
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
