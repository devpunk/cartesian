import UIKit

class VDrawProjectMenu:UIView
{
    private weak var controller:CDrawProject!
    private(set) weak var viewBar:VDrawProjectMenuBar!
    private let kBarHeight:CGFloat = 51
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let viewBar:VDrawProjectMenuBar = VDrawProjectMenuBar(controller:controller)
        self.viewBar = viewBar
        
        addSubview(viewBar)
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:kBarHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: public
    
    func displaySettings()
    {
        
    }
    
    func displayNodes()
    {
        
    }
}
