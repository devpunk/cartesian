import UIKit

class MDrawProjectMenuStateItemShown:MDrawProjectMenuStateItem
{
    private let kBottom:CGFloat = 140
    
    init(controller:CDrawProject)
    {
        super.init(
            controller:controller,
            bottom:kBottom)
    }
    
    override func hide()
    {
        controller.viewProject.viewMenu.layoutBottom.constant = bottom
        controller.modelMenuState.stateHidden(
            controller:controller)
        
        UIView.animate(withDuration:kAnimationDuration)
        { [weak controller] in
            
            controller?.viewProject.layoutIfNeeded()
        }
    }
}
