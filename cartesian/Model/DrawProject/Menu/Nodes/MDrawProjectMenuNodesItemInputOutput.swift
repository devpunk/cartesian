import UIKit

class MDrawProjectMenuNodesItemInputOutput:MDrawProjectMenuNodesItem
{
    private let kAvailable:Bool = true
    
    init()
    {
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeInputOutput"),
            entityName:DNodeInputOutput.entityName,
            available:kAvailable)
    }
}
