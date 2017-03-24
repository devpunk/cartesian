import UIKit

class MDrawProjectMenuNodesItemStarThree:MDrawProjectMenuNodesItem
{
    private let kAvailable:Bool = true
    
    init()
    {
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeStarThree"),
            entityName:DNodeStarThree.entityName,
            available:kAvailable)
    }
}
