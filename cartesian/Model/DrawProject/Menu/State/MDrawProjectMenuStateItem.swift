import UIKit

class MDrawProjectMenuStateItem
{
    let bottom:CGFloat
    let kAnimationDuration:TimeInterval = 0.3
    private weak var controller:CDrawProject!
    
    init(controller:CDrawProject, bottom:CGFloat)
    {
        self.controller = controller
        self.bottom = bottom
    }
    
    //MARK: private
    
    private func layoutNewState()
    {
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
    
    //MARK: public
    
    func show()
    {
        controller.modelMenuState.stateShown(
            controller:controller)
        layoutNewState()
    }
    
    func hide()
    {
        controller.modelMenuState.stateHidden(
            controller:controller)
        layoutNewState()
    }
    
    func half()
    {
        controller.modelMenuState.stateHalf(
            controller:controller)
        layoutNewState()
    }
}
