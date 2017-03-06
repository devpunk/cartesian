import UIKit

class VDrawProject:VView
{
    private weak var controller:CDrawProject!
    private(set) weak var viewMenu:VDrawProjectMenu!
    private(set) weak var viewScroll:VDrawProjectScroll!
    private weak var layoutMenuBottom:NSLayoutConstraint!
    private let kMenuHeight:CGFloat = 171
    private let kMenuMaxBottom:CGFloat = 120
    private let kAnimationDuration:TimeInterval = 0.3
    
    override init(controller:CController)
    {
        super.init(controller:controller)
        self.controller = controller as? CDrawProject
        
        let viewScroll:VDrawProjectScroll = VDrawProjectScroll(
            controller:self.controller)
        self.viewScroll = viewScroll
        
        let viewMenu:VDrawProjectMenu = VDrawProjectMenu(
            controller:self.controller)
        self.viewMenu = viewMenu
        
        addSubview(viewScroll)
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
        
        NSLayoutConstraint.equals(
            view:viewScroll,
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
        viewMenu.viewSettings.viewSize.update()
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
