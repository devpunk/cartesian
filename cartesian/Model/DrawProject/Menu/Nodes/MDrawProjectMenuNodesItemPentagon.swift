import UIKit

class MDrawProjectMenuNodesItemPentagon:MDrawProjectMenuNodesItem
{
    private let kAvailable:Bool = false
    
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuNodesItemPentagon_title", comment:"")
        
        super.init(
            icon:#imageLiteral(resourceName: "assetNodePentagon"),
            entityName:DNodePentagon.entityName,
            title:title,
            available:kAvailable)
    }
}
