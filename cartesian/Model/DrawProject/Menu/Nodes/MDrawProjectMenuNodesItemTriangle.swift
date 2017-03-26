import UIKit

class MDrawProjectMenuNodesItemTriangle:MDrawProjectMenuNodesItem
{
    private let kAvailable:Bool = true
    
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuNodesItemTriangle_title", comment:"")
        
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeTriangle"),
            entityName:DNodeTriangle.entityName,
            title:title,
            available:kAvailable)
    }
}
