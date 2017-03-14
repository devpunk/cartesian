import UIKit

class VDrawProjectMenuLabels:UIView
{
    private weak var controller:CDrawProject!
    private weak var viewAdd:
    
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
    
    //MARK: public
}
