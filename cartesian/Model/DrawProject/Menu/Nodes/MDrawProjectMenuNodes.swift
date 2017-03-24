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
        let itemLozenge:MDrawProjectMenuNodesItemLozenge = MDrawProjectMenuNodesItemLozenge()
        let itemTriangle:MDrawProjectMenuNodesItemTriangle = MDrawProjectMenuNodesItemTriangle()
        
        items = [
            itemOval,
            itemRect,
            itemPentagon,
            itemHexagon,
            itemLozenge,
            itemTriangle]
    }
}
