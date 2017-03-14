import UIKit

class VDrawProjectMenuLabelsFontSize:UIView
{
    private weak var controller:CDrawProject!
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    
}
