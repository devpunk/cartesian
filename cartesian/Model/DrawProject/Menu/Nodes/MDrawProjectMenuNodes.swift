import Foundation

class MDrawProjectMenuNodes
{
    let items:[MDrawProjectMenuNodesItem]
    
    init()
    {
        let itemOval:MDrawProjectMenuNodesItemOval = MDrawProjectMenuNodesItemOval()
        let itemTriangle:MDrawProjectMenuNodesItemTriangle = MDrawProjectMenuNodesItemTriangle()
        let itemRect:MDrawProjectMenuNodesItemRect = MDrawProjectMenuNodesItemRect()
        let itemLozenge:MDrawProjectMenuNodesItemLozenge = MDrawProjectMenuNodesItemLozenge()
        let itemPentagon:MDrawProjectMenuNodesItemPentagon = MDrawProjectMenuNodesItemPentagon()
        let itemHexagon:MDrawProjectMenuNodesItemHexagon = MDrawProjectMenuNodesItemHexagon()
        
        items = [
            itemOval,
            itemTriangle,
            itemRect,
            itemLozenge,
            itemPentagon,
            itemHexagon]
    }
}
