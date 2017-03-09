import UIKit

class MDrawProjectMenuEditBarItemMove:MDrawProjectMenuEditBarItem
{
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuEditBarItemMove_title", comment:"")
        
        super.init(
            title:title,
            image:#imageLiteral(resourceName: "assetGenericMove"))
    }
    
    override func selected(controller:CDrawProject)
    {
        controller.startMoving()
    }
}
