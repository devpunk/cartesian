import UIKit

class MDrawProjectMenuNodesItemHexagon:MDrawProjectMenuNodesItem
{
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuNodesItemHexagon_title", comment:"")
        var available:Bool = false
        
        if let purchased:Bool = MSession.sharedInstance.settings?.purchaseNodeHexagon
        {
            available = purchased
        }
        
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeHexagon"),
            entityName:DNodeHexagon.entityName,
            title:title,
            available:available)
    }
}
