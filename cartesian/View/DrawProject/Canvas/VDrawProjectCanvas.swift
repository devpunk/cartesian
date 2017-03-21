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
    
    //MARK: private
    
    private func addCanvasView(
        type:VDrawProjectCanvasView.Type,
        model:DDrawable)
    {
        let canvasView:VDrawProjectCanvasView = type.init(
            controller:controller,
            model:model)
        
        addSubview(canvasView)
        canvasView.positionCenter()
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
            
            node.stopEditing()
        }
        
        guard
        
            let nodes:[DNode] = controller.model?.nodes?.array as? [DNode],
            let labels:[DLabel] = controller.model?.labels?.array as? [DLabel],
            let links:[DLink] = controller.model?.links?.array as? [DLink]
        
        else
        {
            return
        }
        
        for link:DLink in links
        {
            addCanvasView(
                type:VDrawProjectCanvasLink.self,
                model:link)
        }
        
        for node:DNode in nodes
        {
            addCanvasView(
                type:VDrawProjectCanvasNode.self,
                model:node)
        }
        
        for label:DLabel in labels
        {
            addCanvasView(
                type:VDrawProjectCanvasLabel.self,
                model:label)
        }
    }
}
