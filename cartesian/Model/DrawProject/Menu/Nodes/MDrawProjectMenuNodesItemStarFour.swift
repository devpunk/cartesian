import UIKit

class MDrawProjectMenuNodesItemStarFour:MDrawProjectMenuNodesItem
{
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuNodesItemStarFour_title", comment:"")
        var available:Bool = false
        
        if let purchased:Bool = MSession.sharedInstance.settings?.purchaseNodeStarFour
        {
            available = purchased
        }
        
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeStarFour"),
            entityName:DNodeStarFour.entityName,
            title:title,
            available:available)
    }
}
