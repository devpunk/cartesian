import UIKit

class MDrawProjectStateItemLink:MDrawProjectStateItem
{
    private weak var linkingNode:VDrawProjectCanvasNode?
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
            
            let linkingNode:VDrawProjectCanvasNode = touch.view as? VDrawProjectCanvasNode,
            let editingNode:VDrawProjectCanvasNode = controller.editingView as? VDrawProjectCanvasNode
        
        else
        {
            return
        }
        
        if editingNode !== linkingNode
        {
            linkingNode.startEditing()
            self.linkingNode = linkingNode
        }
        else
        {
            self.linkingNode = nil
        }
    }
    
    override func touchFinished()
    {
        guard
            
            let linkingNode:DNode = self.linkingNode?.viewSpatial.model as? DNode
            
        else
        {
            return
        }
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.controller.linkNode(destination:linkingNode)
        }
        
        self.linkingNode = nil
    }
}
