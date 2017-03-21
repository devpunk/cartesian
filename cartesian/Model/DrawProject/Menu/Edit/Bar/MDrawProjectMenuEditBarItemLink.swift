import UIKit

class MDrawProjectMenuEditBarItemLink:MDrawProjectMenuEditBarItem
{
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuEditBarItemLink_title", comment:"")
        
        super.init(
            title:title,
            image:#imageLiteral(resourceName: "assetGenericLink"))
    }
    
    override func selected(controller:CDrawProject)
    {
        controller.startLinking()
    }
}
