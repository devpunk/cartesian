import UIKit

class MDrawProjectMenuNodesItemLozenge:MDrawProjectMenuNodesItem
{
    private let kAvailable:Bool = true
    
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuNodesItemLozenge_title", comment:"")
        
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeLozenge"),
            entityName:DNodeLozenge.entityName,
            title:title,
            available:kAvailable)
    }
}
