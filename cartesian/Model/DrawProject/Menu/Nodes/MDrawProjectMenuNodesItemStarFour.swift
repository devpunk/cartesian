import UIKit

class MDrawProjectMenuNodesItemStarFour:MDrawProjectMenuNodesItem
{
    private let kAvailable:Bool = true
    
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuNodesItemStarFour_title", comment:"")
        
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeStarFour"),
            entityName:DNodeStarFour.entityName,
            title:title,
            available:kAvailable)
    }
}
