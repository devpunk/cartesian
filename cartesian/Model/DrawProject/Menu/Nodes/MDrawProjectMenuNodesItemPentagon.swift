import UIKit

class MDrawProjectMenuNodesItemPentagon:MDrawProjectMenuNodesItem
{
    private let kAvailable:Bool = false
    
    init()
    {
        super.init(
            icon:#imageLiteral(resourceName: "assetNodePentagon"),
            entityName:DNodePentagon.entityName,
            available:kAvailable)
    }
}
