import Foundation

class MDrawProjectMenuEditBar
{
    let items:[MDrawProjectMenuEditBarItem]
    
    init()
    {
        let itemColor:MDrawProjectMenuEditBarItemColor = MDrawProjectMenuEditBarItemColor()
        let itemResize:MDrawProjectMenuEditBarItemResize = MDrawProjectMenuEditBarItemResize()
        let itemMove:MDrawProjectMenuEditBarItemMove = MDrawProjectMenuEditBarItemMove()
        let itemRotate:MDrawProjectMenuEditBarItemRotate = MDrawProjectMenuEditBarItemRotate()
        let itemTrash:MDrawProjectMenuEditBarItemTrash = MDrawProjectMenuEditBarItemTrash()
        
        items = [
            itemColor,
            itemResize,
            itemMove,
            itemRotate,
            itemTrash]
    }
}
