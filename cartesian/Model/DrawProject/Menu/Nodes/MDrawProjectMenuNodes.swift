import Foundation

class MDrawProjectMenuNodes
{
    let items:[MDrawProjectMenuNodesItem]
    
    init()
    {
        let itemOval:MDrawProjectMenuNodesItemOval = MDrawProjectMenuNodesItemOval()
        let itemRect:MDrawProjectMenuNodesItemRect = MDrawProjectMenuNodesItemRect()
        let itemPentagon:MDrawProjectMenuNodesItemPentagon = MDrawProjectMenuNodesItemPentagon()
        let itemHexagon:MDrawProjectMenuNodesItemHexagon = MDrawProjectMenuNodesItemHexagon()
        
        items = [
            itemOval,
            itemRect,
            itemPentagon,
            itemHexagon]
    }
}
