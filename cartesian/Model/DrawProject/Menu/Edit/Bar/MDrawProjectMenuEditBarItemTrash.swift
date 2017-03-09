import UIKit

class MDrawProjectMenuEditBarItemTrash:MDrawProjectMenuEditBarItem
{
    private let kKeepSelected:Bool = false
    
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuEditBarItemTrash_title", comment:"")
        
        super.init(
            title:title,
            image:#imageLiteral(resourceName: "assetGenericTrash"),
            keepSelected:kKeepSelected)
    }
}
