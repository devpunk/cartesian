import UIKit

class MDrawProjectMenuNodesItemLozenge:MDrawProjectMenuNodesItem
{
    private let kAvailable:Bool = true
    
    init()
    {
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeLozenge"),
            entityName:DNodeLozenge.entityName,
            available:kAvailable)
    }
}
