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
    
    override func hide()
    {
        controller.modelMenuState.stateHidden(
            controller:controller)
        
        guard
            
            let newBottom:CGFloat = controller.modelMenuState.current?.bottom
            
        else
        {
            return
        }
        
        controller.viewProject.viewMenu.layoutBottom.constant = newBottom
        
        UIView.animate(withDuration:kAnimationDuration)
        { [weak controller] in
            
            controller?.viewProject.layoutIfNeeded()
        }
    }
}
