import UIKit

class MDrawProjectMenuNodesItemTriangle:MDrawProjectMenuNodesItem
{
    private let kAvailable:Bool = true
    
    init()
    {
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeTriangle"),
            entityName:DNodeTriangle.entityName,
            available:kAvailable)
    }
}
