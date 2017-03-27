import UIKit

class MDrawProjectMenuNodesItemStarSix:MDrawProjectMenuNodesItem
{
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuNodesItemStarSix_title", comment:"")
        var available:Bool = false
        
        if let purchased:Bool = MSession.sharedInstance.settings?.purchaseNodeStarSix
        {
            available = purchased
        }
        
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeStarSix"),
            entityName:DNodeStarSix.entityName,
            title:title,
            available:available)
    }
}
