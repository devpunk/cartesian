import UIKit

class MDrawProjectMenuNodesItemHexagon:MDrawProjectMenuNodesItem
{
    private let kAvailable:Bool = true
    
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuNodesItemHexagon_title", comment:"")
        
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeHexagon"),
            entityName:DNodeHexagon.entityName,
            title:title,
            available:kAvailable)
    }
}
