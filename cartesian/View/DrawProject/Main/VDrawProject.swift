import UIKit

class VDrawProject:VView
{
    private weak var controller:CDrawProject!
    private(set) weak var viewMenu:VDrawProjectMenu!
    private(set) weak var scrollView:ui
    private weak var layoutMenuBottom:NSLayoutConstraint!
    private let kMenuHeight:CGFloat = 251
    private let kMenuMaxBottom:CGFloat = 200
    private let kAnimationDuration:TimeInterval = 0.3
    
    override init(controller:CController)
    {
        super.init(controller:controller)
        self.controller = controller as? CDrawProject
        
        let viewMenu:VDrawProjectMenu = VDrawProjectMenu(
            controller:self.controller)
        self.viewMenu = viewMenu
        
        addSubview(viewMenu)
        
        NSLayoutConstraint.height(
            view:viewMenu,
            constant:kMenuHeight)
        layoutMenuBottom = NSLayoutConstraint.bottomToBottom(
            view:viewMenu,
            toView:self,
            constant:kMenuMaxBottom)
        NSLayoutConstraint.equalsHorizontal(
            view:viewMenu,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: public
    
    func viewDidAppeared()
    {
        viewMenu.viewBar.selectSettings()
    }
    
    func showMenu()
    {
        layoutMenuBottom.constant = 0
        
        UIView.animate(withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.layoutIfNeeded()
        }
    }
    
    func hideMenu()
    {
        layoutMenuBottom.constant = kMenuMaxBottom
        
        UIView.animate(withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.layoutIfNeeded()
        }
    }
}
