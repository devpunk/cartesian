import UIKit

class MDrawProjectMenuNodesItemStarFive:MDrawProjectMenuNodesItem
{
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuNodesItemStarFive_title", comment:"")
        var available:Bool = false
        
        if let purchased:Bool = MSession.sharedInstance.settings?.purchaseNodeStarFive
        {
            available = purchased
        }
        
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeStarFive"),
            entityName:DNodeStarFive.entityName,
            title:title,
            available:available)
    }
}
