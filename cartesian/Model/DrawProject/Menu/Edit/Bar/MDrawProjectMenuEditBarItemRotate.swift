import UIKit

class MDrawProjectMenuEditBarItemRotate:MDrawProjectMenuEditBarItem
{
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuEditBarItemRotate_title", comment:"")
        
        super.init(
            title:title,
            image:#imageLiteral(resourceName: "assetGenericRotate"))
    }
    
    override func selected(controller:CDrawProject)
    {
        guard
            
            let node:DNode = controller.editingNode?.viewSpatial.model as? DNode
        
        else
        {
            return
        }
        
        controller.viewProject.showRotate(node:node)
    }
}
