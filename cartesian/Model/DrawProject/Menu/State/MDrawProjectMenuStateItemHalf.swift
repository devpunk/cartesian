import UIKit

class MDrawProjectMenuStateItemHalf:MDrawProjectMenuStateItem
{
    private let kBottom:CGFloat = 80
    
    init(controller:CDrawProject)
    {
        super.init(
            controller:controller,
            bottom:kBottom)
    }
    
    override func half()
    {
    }
}
