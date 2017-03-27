import UIKit

class MDrawProjectMenuNodesItemLozenge:MDrawProjectMenuNodesItem
{
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuNodesItemLozenge_title", comment:"")
        var available:Bool = false
        
        if let purchased:Bool = MSession.sharedInstance.settings?.purchaseNodeLozenge
        {
            available = purchased
        }
        
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeLozenge"),
            entityName:DNodeLozenge.entityName,
            title:title,
            available:available)
    }
}
