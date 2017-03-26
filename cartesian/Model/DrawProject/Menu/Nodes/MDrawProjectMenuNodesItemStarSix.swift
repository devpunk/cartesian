import UIKit

class MDrawProjectMenuNodesItemStarSix:MDrawProjectMenuNodesItem
{
    private let kAvailable:Bool = true
    
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuNodesItemStarSix_title", comment:"")
        
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeStarSix"),
            entityName:DNodeStarSix.entityName,
            title:title,
            available:kAvailable)
    }
}
