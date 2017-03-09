import Foundation

class MDrawProjectState
{
    private(set) var current:MDrawProjectStateItem?
    
    init()
    {
        current = MDrawProjectStateItemStand()
    }
    
    //MARK: public
    
    func stateMoving()
    {
        current = MDrawProjectStateItemMove()
    }
    
    func stateEditing()
    {
        current = MDrawProjectStateItemEdit()
    }
    
    func stateStand()
    {
        current = MDrawProjectStateItemStand()
    }
}
