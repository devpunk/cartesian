import Foundation

class MDrawProjectMenuText
{
    let items:[MDrawProjectMenuTextItem]
    
    init()
    {
        let itemMove:MDrawProjectMenuTextItemMove = MDrawProjectMenuTextItemMove()
        let itemTrash:MDrawProjectMenuTextItemTrash = MDrawProjectMenuTextItemTrash()
        
        items = [
            itemMove,
            itemTrash]
    }
}
