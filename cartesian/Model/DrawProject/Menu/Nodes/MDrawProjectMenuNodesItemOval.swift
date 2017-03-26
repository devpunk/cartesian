import UIKit

class MDrawProjectMenuNodesItemOval:MDrawProjectMenuNodesItem
{
    private let kAvailable:Bool = true
    
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuNodesItemOval_title", comment:"")
        
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeOval"),
            entityName:DNodeOval.entityName,
            title:title,
            available:kAvailable)
    }
}
