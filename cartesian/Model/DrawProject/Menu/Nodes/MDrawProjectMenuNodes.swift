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
        let itemStarThree:MDrawProjectMenuNodesItemStarThree = MDrawProjectMenuNodesItemStarThree()
        let itemStarFour:MDrawProjectMenuNodesItemStarFour = MDrawProjectMenuNodesItemStarFour()
        let itemStarFive:MDrawProjectMenuNodesItemStarFive = MDrawProjectMenuNodesItemStarFive()
        let itemStarSix:MDrawProjectMenuNodesItemStarSix = MDrawProjectMenuNodesItemStarSix()
        
        items = [
            itemOval,
            itemTriangle,
            itemRect,
            itemLozenge,
            itemPentagon,
            itemHexagon,
            itemStarThree,
            itemStarFour,
            itemStarFive,
            itemStarSix]
    }
}
