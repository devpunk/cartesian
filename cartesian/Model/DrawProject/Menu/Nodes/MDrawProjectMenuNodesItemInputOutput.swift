import UIKit

class MDrawProjectMenuNodesItemInputOutput:MDrawProjectMenuNodesItem
{
    private let kAvailable:Bool = true
    
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuNodesItemInputOutput_title", comment:"")
        
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeInputOutput"),
            entityName:DNodeInputOutput.entityName,
            title:title,
            available:kAvailable)
    }
}
