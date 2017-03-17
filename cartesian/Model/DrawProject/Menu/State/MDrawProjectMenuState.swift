import UIKit

class MDrawProjectMenuState
{
    private(set) var current:MDrawProjectMenuStateItem?
    let kMenuHeight:CGFloat = 191
    
    //MARK: public
    
    func stateHidden(controller:CDrawProject)
    {
        current = MDrawProjectMenuStateItemHidden(controller:controller)
    }
    
    func stateShown(controller:CDrawProject)
    {
        current = MDrawProjectMenuStateItemShown(controller:controller)
    }
    
    func stateHalf(controller:CDrawProject)
    {
        current = MDrawProjectMenuStateItemHalf(controller:controller)
    }
}
