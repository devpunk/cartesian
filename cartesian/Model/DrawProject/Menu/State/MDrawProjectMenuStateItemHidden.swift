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
    
    override func show()
    {
        controller.viewProject.viewMenu.layoutBottom.constant = bottom
        controller.modelMenuState.stateShown(
            controller:controller)
        
        UIView.animate(withDuration:kAnimationDuration)
        { [weak controller] in
            
            controller?.viewProject.layoutIfNeeded()
        }
    }
}
