import UIKit

class MDrawProjectMenuNodesItemStarThree:MDrawProjectMenuNodesItem
{
    private let kAvailable:Bool = true
    
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuNodesItemStarThree_title", comment:"")
        
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeStarThree"),
            entityName:DNodeStarThree.entityName,
            title:title,
            available:kAvailable)
    }
}
