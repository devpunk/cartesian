import UIKit

class MDrawProjectMenuEditBarItemResize:MDrawProjectMenuEditBarItem, MDrawProjectSizeDelegate
{
    private weak var controller:CDrawProject?
    
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuEditBarItemResize_title", comment:"")
        
        super.init(
            title:title,
            image:#imageLiteral(resourceName: "assetGenericResize"))
    }
    
    override func selected(controller:CDrawProject)
    {
        self.controller = controller
        
        controller.viewProject.showSize(
            title:NSLocalizedString("MDrawProjectMenuEditBarItemResize_defaultSize", comment:""),
            delegate:self)
    }
    
    //MARK: size delegate
    
    func sizeChanged(width:CGFloat, height:CGFloat)
    {
        guard
            
            let node:DNode = controller?.editingNode?.viewSpatial.model
            
        else
        {
            return
        }
        
        node.width = Float(width)
        node.height = Float(height)
        node.notifyDraw()
    }
    
    func originalWidth() -> CGFloat
    {
        guard
            
            let node:DNode = controller?.editingNode?.viewSpatial.model
            
        else
        {
            return 0
        }
        
        let floatWidth:CGFloat = CGFloat(node.width)
        
        return floatWidth
    }
    
    func originalHeight() -> CGFloat
    {
        guard
            
            let node:DNode = controller?.editingNode?.viewSpatial.model
            
        else
        {
            return 0
        }
        
        let floatHeight:CGFloat = CGFloat(node.height)
        
        return floatHeight
    }
}
