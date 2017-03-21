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
    
    override func touchBegan(touch:UITouch)
    {
        controller.viewProject.viewMenu.viewBar.viewText.textField.delegate = nil
        UIApplication.shared.keyWindow!.endEditing(true)
        
        beganEditing(touch:touch)
    }
}
