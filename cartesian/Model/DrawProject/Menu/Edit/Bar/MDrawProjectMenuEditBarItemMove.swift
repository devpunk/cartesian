import UIKit

class MDrawProjectMenuEditBarItemMove:MDrawProjectMenuEditBarItem
{
    private let kKeepSelected:Bool = true
    
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuEditBarItemMove_title", comment:"")
        
        super.init(
            title:title,
            image:#imageLiteral(resourceName: "assetGenericMove"),
            keepSelected:kKeepSelected)
    }
}
