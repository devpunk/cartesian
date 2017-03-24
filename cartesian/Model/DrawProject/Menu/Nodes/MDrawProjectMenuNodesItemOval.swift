import UIKit

class MDrawProjectMenuNodesItemOval:MDrawProjectMenuNodesItem
{
    private let kAvailable:Bool = true
    
    init()
    {
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeOval"),
            entityName:DNodeOval.entityName,
            available:kAvailable)
    }
}
