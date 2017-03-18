import UIKit

class MDrawProjectMenuTextItemFont:MDrawProjectMenuTextItem
{
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuTextItemFont_title", comment:"")
        
        super.init(
            title:title,
            image:#imageLiteral(resourceName: "assetGenericFont"))
    }
    
    override func selected(controller:CDrawProject)
    {
        controller.startMoving()
    }
}
