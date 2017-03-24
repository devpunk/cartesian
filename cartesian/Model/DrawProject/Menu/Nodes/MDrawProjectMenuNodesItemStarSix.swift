import UIKit

class MDrawProjectMenuNodesItemStarSix:MDrawProjectMenuNodesItem
{
    private let kAvailable:Bool = true
    
    init()
    {
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeStarSix"),
            entityName:DNodeStarSix.entityName,
            available:kAvailable)
    }
}
