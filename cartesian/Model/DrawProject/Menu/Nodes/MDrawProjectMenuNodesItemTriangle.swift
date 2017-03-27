import UIKit

class MDrawProjectMenuNodesItemTriangle:MDrawProjectMenuNodesItem
{
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuNodesItemTriangle_title", comment:"")
        var available:Bool = false
        
        if let purchased:Bool = MSession.sharedInstance.settings?.purchaseNodeTriangle
        {
            available = purchased
        }
        
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeTriangle"),
            entityName:DNodeTriangle.entityName,
            title:title,
            available:available)
    }
}
