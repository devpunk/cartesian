import UIKit

class VDrawProjectMenuLabels:UIView
{
    private weak var controller:CDrawProject!
    private weak var viewAdd:VDrawProjectMenuLabelsAdd!
    private let kAddWidth:CGFloat = 105
    private let kAddHeight:CGFloat = 50
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let viewAdd:VDrawProjectMenuLabelsAdd = VDrawProjectMenuLabelsAdd(
            controller:controller)
        self.viewAdd = viewAdd
        
        addSubview(viewAdd)
        
        NSLayoutConstraint.topToTop(
            view:viewAdd,
            toView:self)
        NSLayoutConstraint.height(
            view:viewAdd,
            constant:kAddHeight)
        NSLayoutConstraint.leftToLeft(
            view:viewAdd,
            toView:self)
        NSLayoutConstraint.width(
            view:viewAdd,
            constant:kAddWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: public
}
