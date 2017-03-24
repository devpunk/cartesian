import UIKit

class VDrawProjectStore:UIView
{
    private weak var controller:CDrawProject!
    private weak var purchase:MDrawProjectMenuNodesItem!
    
    init(
        controller:CDrawProject,
        purchase:MDrawProjectMenuNodesItem)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        self.purchase = purchase
        
        let blur:VBlur = VBlur.dark()
        
        addSubview(blur)
        
        NSLayoutConstraint.equals(
            view:blur,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
