import Foundation

class MDrawProjectMenuEditBar
{
    let items:[MDrawProjectMenuEditBarItem]
    
    init()
    {
        let itemLink:MDrawProjectMenuEditBarItemLink = MDrawProjectMenuEditBarItemLink()
        let itemColor:MDrawProjectMenuEditBarItemColor = MDrawProjectMenuEditBarItemColor()
        let itemResize:MDrawProjectMenuEditBarItemResize = MDrawProjectMenuEditBarItemResize()
        let itemMove:MDrawProjectMenuEditBarItemMove = MDrawProjectMenuEditBarItemMove()
        let itemRotate:MDrawProjectMenuEditBarItemRotate = MDrawProjectMenuEditBarItemRotate()
        let itemTrash:MDrawProjectMenuEditBarItemTrash = MDrawProjectMenuEditBarItemTrash()
        
        items = [
            itemLink,
            itemColor,
            itemResize,
            itemMove,
            itemRotate,
            itemTrash]
    }
}
