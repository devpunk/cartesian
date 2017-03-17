import UIKit

class MDrawProjectStateItemText:MDrawProjectStateItem
{
    private let kScrollEnabled:Bool = false
    
    init(controller:CDrawProject)
    {
        super.init(
            controller:controller,
            scrollEnabled:kScrollEnabled)
    }
}
