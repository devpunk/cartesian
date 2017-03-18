import Foundation

class MDrawProjectMenuText
{
    let items:[MDrawProjectMenuTextItem]
    
    init()
    {
        let itemFont:MDrawProjectMenuTextItemFont = MDrawProjectMenuTextItemFont()
        let itemSize:MDrawProjectMenuTextItemSize = MDrawProjectMenuTextItemSize()
        let itemMove:MDrawProjectMenuTextItemMove = MDrawProjectMenuTextItemMove()
        let itemTrash:MDrawProjectMenuTextItemTrash = MDrawProjectMenuTextItemTrash()
        
        items = [
            itemFont,
            itemSize,
            itemMove,
            itemTrash]
    }
}
