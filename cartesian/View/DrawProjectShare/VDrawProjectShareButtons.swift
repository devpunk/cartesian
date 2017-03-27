import UIKit

class VDrawProjectShareButtons:UIView
{
    private weak var controller:CDrawProjectShare!
    
    init(controller:CDrawProjectShare)
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
