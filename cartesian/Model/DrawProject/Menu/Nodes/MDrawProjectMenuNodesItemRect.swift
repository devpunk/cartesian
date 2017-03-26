import UIKit

class MDrawProjectMenuNodesItemRect:MDrawProjectMenuNodesItem
{
    private let kAvailable:Bool = true
    
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuNodesItemRect_title", comment:"")
        
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeRect"),
            entityName:DNodeRect.entityName,
            title:title,
            available:kAvailable)
    }
}
