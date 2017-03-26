import UIKit

class MDrawProjectMenuNodesItemStarFive:MDrawProjectMenuNodesItem
{
    private let kAvailable:Bool = true
    
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuNodesItemStarFive_title", comment:"")
        
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeStarFive"),
            entityName:DNodeStarFive.entityName,
            title:title,
            available:kAvailable)
    }
}
