import UIKit

class VDrawProjectShare:VView
{
    private weak var controller:CDrawProjectShare!
    
    override init(controller:CController)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.clear
        self.controller = controller as? CDrawProjectShare
        
        let blur:VBlur = VBlur.extraLight()
        
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
