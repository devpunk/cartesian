import UIKit

class MDrawProjectMenuNodesItemPentagon:MDrawProjectMenuNodesItem
{
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuNodesItemPentagon_title", comment:"")
        var available:Bool = false
        
        if let purchased:Bool = MSession.sharedInstance.settings?.purchaseNodePentagon
        {
            available = purchased
        }
        
        super.init(
            icon:#imageLiteral(resourceName: "assetNodePentagon"),
            entityName:DNodePentagon.entityName,
            title:title,
            available:available)
    }
}
