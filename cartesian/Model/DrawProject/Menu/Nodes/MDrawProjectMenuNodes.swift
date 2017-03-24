import Foundation

class MDrawProjectMenuNodes
{
    let items:[MDrawProjectMenuNodesItem]
    
    init()
    {
        let itemOval:MDrawProjectMenuNodesItemOval = MDrawProjectMenuNodesItemOval()
        let itemRect:MDrawProjectMenuNodesItemRect = MDrawProjectMenuNodesItemRect()
        let itemPentagon:MDrawProjectMenuNodesItemPentagon = MDrawProjectMenuNodesItemPentagon()
        
        items = [
            itemOval,
            itemRect,
            itemPentagon]
    }
}
