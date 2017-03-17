import UIKit

class MDrawProjectMenuTextItemMove:MDrawProjectMenuTextItem
{
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuTextItemMove_title", comment:"")
        
        super.init(
            title:title,
            image:#imageLiteral(resourceName: "assetGenericMove"))
    }
    
    override func selected(controller:CDrawProject)
    {
        controller.startMoving()
    }
}
