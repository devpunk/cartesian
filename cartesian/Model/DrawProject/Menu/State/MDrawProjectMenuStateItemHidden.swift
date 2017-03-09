import UIKit

class MDrawProjectMenuStateItemHidden:MDrawProjectMenuStateItem
{
    private let kBottom:CGFloat = 140
    
    init(controller:CDrawProject)
    {
        super.init(
            controller:controller,
            bottom:kBottom)
    }
}
