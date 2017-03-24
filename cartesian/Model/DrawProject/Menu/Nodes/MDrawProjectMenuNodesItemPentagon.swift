import UIKit

class MDrawProjectMenuNodesItemPentagon:MDrawProjectMenuNodesItem
{
    private let kAvailable:Bool = true
    
    init()
    {
        super.init(
            icon:#imageLiteral(resourceName: "assetNodePentagon"),
            entityName:DNodePentagon.entityName,
            available:kAvailable)
    }
}
