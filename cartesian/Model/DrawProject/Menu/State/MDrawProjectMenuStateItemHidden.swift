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
        controller.modelMenuState.stateShown(
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
