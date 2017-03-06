import Foundation

class MDrawProjectMenuNodes
{
    let items:[MDrawProjectMenuNodesItem]
    
    init()
    {
        let itemOval:MDrawProjectMenuNodesItemOval = MDrawProjectMenuNodesItemOval()
        let itemRect:MDrawProjectMenuNodesItemRect = MDrawProjectMenuNodesItemRect()
        
        items = [
            itemOval,
            itemRect]
    }
}
