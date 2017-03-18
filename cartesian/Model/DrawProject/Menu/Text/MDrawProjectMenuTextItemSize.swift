import UIKit

class MDrawProjectMenuTextItemSize:MDrawProjectMenuTextItem
{
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuTextItemSize_title", comment:"")
        
        super.init(
            title:title,
            image:#imageLiteral(resourceName: "assetGenericFontSize"))
    }
    
    override func selected(controller:CDrawProject)
    {
        controller.startMoving()
    }
}
