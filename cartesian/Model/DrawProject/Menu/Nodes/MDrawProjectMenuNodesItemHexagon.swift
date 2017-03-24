import UIKit

class MDrawProjectMenuNodesItemHexagon:MDrawProjectMenuNodesItem
{
    private let kAvailable:Bool = true
    
    init()
    {
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeHexagon"),
            entityName:DNodeHexagon.entityName,
            available:kAvailable)
    }
}
