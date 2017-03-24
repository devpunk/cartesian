import UIKit

class MDrawProjectMenuNodesItemStarFive:MDrawProjectMenuNodesItem
{
    private let kAvailable:Bool = true
    
    init()
    {
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeStarFive"),
            entityName:DNodeStarFive.entityName,
            available:kAvailable)
    }
}
