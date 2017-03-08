import Foundation

class MDrawProjectMenuEditBar
{
    let items:[MDrawProjectMenuEditBarItem]
    
    init()
    {
        let itemTrash:MDrawProjectMenuEditBarItemTrash = MDrawProjectMenuEditBarItemTrash()
        
        items = [
            itemTrash]
    }
}
