import Foundation

class MDrawProjectState
{
    private(set) var current:MDrawProjectStateItem?
    
    //MARK: public
    
    func stateMoving(controller:CDrawProject)
    {
        current = MDrawProjectStateItemMove(
            controller:controller)
    }
    
    func stateEditing(controller:CDrawProject)
    {
        current = MDrawProjectStateItemEdit(
            controller:controller)
    }
    
    func stateStand(controller:CDrawProject)
    {
        current = MDrawProjectStateItemStand(
            controller:controller)
    }
    
    func stateText(controller:CDrawProject)
    {
        current = MDrawProjectStateItemText(
            controller:controller)
    }
    
    func stateLinking(controller:CDrawProject)
    {
        current = MDrawProjectStateItemLink(
            controller:controller)
    }
}
