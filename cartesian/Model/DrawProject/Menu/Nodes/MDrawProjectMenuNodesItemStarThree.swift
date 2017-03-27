import UIKit

class MDrawProjectMenuNodesItemStarThree:MDrawProjectMenuNodesItem
{
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuNodesItemStarThree_title", comment:"")
        var available:Bool = false
        
        if let purchased:Bool = MSession.sharedInstance.settings?.purchaseNodeStarThree
        {
            available = purchased
        }
        
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeStarThree"),
            entityName:DNodeStarThree.entityName,
            title:title,
            available:available)
    }
}
