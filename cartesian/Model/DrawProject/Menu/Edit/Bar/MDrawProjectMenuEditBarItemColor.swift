import UIKit

class MDrawProjectMenuEditBarItemColor:MDrawProjectMenuEditBarItem
{
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuEditBarItemColor_title", comment:"")
        
        super.init(
            title:title,
            image:#imageLiteral(resourceName: "assetGenericColor"))
    }
}
