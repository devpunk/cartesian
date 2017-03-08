import Foundation

class MDrawProjectMenuEditBar
{
    let items:[MDrawProjectMenuEditBarItem]
    
    init()
    {
        let itemColor:MDrawProjectMenuEditBarItemColor = MDrawProjectMenuEditBarItemColor()
        let itemTrash:MDrawProjectMenuEditBarItemTrash = MDrawProjectMenuEditBarItemTrash()
        
        items = [
            itemColor,
            itemTrash]
    }
}
