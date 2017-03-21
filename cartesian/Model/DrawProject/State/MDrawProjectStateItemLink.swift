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
            let editingNode:VDrawProjectCanvasNode = controller.editingNode
        
        else
        {
            return
        }
        
        if editingNode !== linkingNode
        {
            linkingNode.startEffect()
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
            
            let linkingNode:VDrawProjectCanvasNode = self.linkingNode
            
        else
        {
            return
        }
        
        DManager.sharedInstance?.save()
        
        self.linkingNode = nil
    }
}
