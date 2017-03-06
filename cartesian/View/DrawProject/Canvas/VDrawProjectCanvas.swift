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
    
    //MARK: public
    
    func draw()
    {
        for subview:UIView in subviews
        {
            subview.removeFromSuperview()
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
                model:node)
            
            addSubview(viewNode)
            viewNode.centerNode()
        }
    }
}
