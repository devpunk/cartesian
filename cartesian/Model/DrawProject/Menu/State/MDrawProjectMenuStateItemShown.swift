import UIKit

class MDrawProjectMenuStateItemShown:MDrawProjectMenuStateItem
{
    private let kBottom:CGFloat = 0
    
    init(controller:CDrawProject)
    {
        super.init(
            controller:controller,
            bottom:kBottom)
    }
    
    override func show()
    {
    }
}
