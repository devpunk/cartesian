import UIKit

class MDrawProjectMenuNodesItemRect:MDrawProjectMenuNodesItem
{
    private let kAvailable:Bool = true
    
    init()
    {
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeRect"),
            entityName:DNodeRect.entityName,
            available:kAvailable)
    }
}
