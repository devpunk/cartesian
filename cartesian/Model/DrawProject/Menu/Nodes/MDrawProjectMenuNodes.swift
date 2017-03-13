import Foundation

class MDrawProjectMenuNodes
{
    let items:[MDrawProjectMenuNodesItem]
    
    init()
    {
        let itemText:MDrawProjectMenuNodesItemText = MDrawProjectMenuNodesItemText()
        let itemOval:MDrawProjectMenuNodesItemOval = MDrawProjectMenuNodesItemOval()
        let itemRect:MDrawProjectMenuNodesItemRect = MDrawProjectMenuNodesItemRect()
        
        items = [
            itemText,
            itemOval,
            itemRect]
    }
}
