import UIKit

class MDrawProjectMenuNodesItemText:MDrawProjectMenuNodesItem
{
    init()
    {
        super.init(
            icon:#imageLiteral(resourceName: "assetNodeText"),
            entityName:DNodeText.entityName)
    }
}
