import UIKit

class MDrawProjectMenuNodesItemInputOutput:MDrawProjectMenuNodesItem
{
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuNodesItemInputOutput_title", comment:"")
        var available:Bool = false
        
        if let purchased:Bool = MSession.sharedInstance.settings?.purchaseNodeInputOutput
        {
            available = purchased
        }
        
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeInputOutput"),
            entityName:DNodeInputOutput.entityName,
            title:title,
            available:available)
    }
}
