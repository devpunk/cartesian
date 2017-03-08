import UIKit

class MDrawProjectMenuEditBarItemColor:MDrawProjectMenuEditBarItem, MDrawProjectColorDelegate
{
    private weak var controller:CDrawProject?
    
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuEditBarItemColor_title", comment:"")
        
        super.init(
            title:title,
            image:#imageLiteral(resourceName: "assetGenericColor"))
    }
    
    override func selected(controller:CDrawProject)
    {
        self.controller = controller
        
        controller.viewProject.showColors(
            title:NSLocalizedString("MDrawProjectMenuEditBarItemColor_defaultColor", comment:""),
            delegate:self)
    }
    
    //MARK: color delegate
    
    func colorSelected(index:Int)
    {
        guard
            
            let controller:CDrawProject = self.controller,
            let node:DNode = controller.editingNode?.viewSpatial.model
        
        else
        {
            return
        }
        
        let color:MDrawProjectColorItem = controller.modelColor.items[index]
        node.colorWithColor(color:color.color)
    }
}
