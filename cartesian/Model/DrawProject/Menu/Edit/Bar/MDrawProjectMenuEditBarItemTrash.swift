import UIKit

class MDrawProjectMenuEditBarItemTrash:MDrawProjectMenuEditBarItem
{
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuEditBarItemTrash_title", comment:"")
        
        super.init(
            title:title,
            image:#imageLiteral(resourceName: "assetGenericTrash"))
    }
    
    override func selected(controller:CDrawProject)
    {
        
    }
    
    //MARK: private
    
    private func confirmDelete(node:DNode)
    {
        
    }
}
