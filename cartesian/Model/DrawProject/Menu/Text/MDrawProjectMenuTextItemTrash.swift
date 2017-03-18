import UIKit

class MDrawProjectMenuTextItemTrash:MDrawProjectMenuTextItem
{
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuTextItemTrash_title", comment:"")
        
        super.init(
            title:title,
            image:#imageLiteral(resourceName: "assetGenericTrash"))
    }
    
    override func selected(controller:CDrawProject)
    {
    }
}
