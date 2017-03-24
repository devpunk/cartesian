import UIKit

class MDrawProjectMenuNodesItemStarFour:MDrawProjectMenuNodesItem
{
    private let kAvailable:Bool = true
    
    init()
    {
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeStarFour"),
            entityName:DNodeStarFour.entityName,
            available:kAvailable)
    }
}
