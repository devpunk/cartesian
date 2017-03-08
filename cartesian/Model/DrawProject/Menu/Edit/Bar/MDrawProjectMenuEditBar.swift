import Foundation

class MDrawProjectMenuEditBar
{
    let items:[MDrawProjectMenuEditBarItem]
    
    init()
    {
        let itemColor:MDrawProjectMenuEditBarItemColor = MDrawProjectMenuEditBarItemColor()
        let itemResize:MDrawProjectMenuEditBarItemResize = MDrawProjectMenuEditBarItemResize()
        let itemTrash:MDrawProjectMenuEditBarItemTrash = MDrawProjectMenuEditBarItemTrash()
        
        items = [
            itemColor,
            itemResize,
            itemTrash]
    }
}
