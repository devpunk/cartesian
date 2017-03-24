import UIKit

class MDrawProjectMenuNodesItemStarFive:MDrawProjectMenuNodesItem
{
    private let kAvailable:Bool = true
    
    init()
    {
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeStarFour"),
            entityName:DNodeStarFive.entityName,
            available:kAvailable)
    }
}
