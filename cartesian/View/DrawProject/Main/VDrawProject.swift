import UIKit

class VDrawProject:VView
{
    private weak var controller:CDrawProject!
    private(set) weak var viewMenu:VDrawProjectMenu!
    private(set) weak var viewScroll:VDrawProjectScroll!
    private(set) weak var viewColor:VDrawProjectColor?
    private(set) weak var viewSize:VDrawProjectSize?
    private weak var layoutMenuBottom:NSLayoutConstraint!
    private let kMenuHeight:CGFloat = 191
    private let kMenuMaxBottom:CGFloat = 140
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
        
        let viewRules:VDrawProjectRules = VDrawProjectRules(
            controller:self.controller)
        viewScroll.viewRules = viewRules
        
        addSubview(viewScroll)
        addSubview(viewRules)
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
        
        NSLayoutConstraint.equals(
            view:viewRules,
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
        viewScroll.viewCanvas.draw()
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
    
    func showColor(title:String, delegate:MDrawProjectColorDelegate)
    {
        self.viewColor?.removeFromSuperview()
        
        let viewColor:VDrawProjectColor = VDrawProjectColor(
            controller:controller,
            delegate:delegate)
        viewColor.viewBar.labelTitle.text = title
        self.viewColor = viewColor
        
        addSubview(viewColor)
        
        NSLayoutConstraint.equals(
            view:viewColor,
            toView:self)
        
        layoutIfNeeded()
        viewColor.animateShow()
    }
    
    func showSize(title:String, delegate:MDrawProjectSizeDelegate)
    {
        self.viewSize?.removeFromSuperview()
        
        let viewSize:VDrawProjectSize = VDrawProjectSize(
            controller:controller,
            delegate:delegate)
        viewSize.viewBar.labelTitle.text = title
        self.viewSize = viewSize
        
        addSubview(viewSize)
        
        NSLayoutConstraint.equals(
            view:viewSize,
            toView:self)
        
        layoutIfNeeded()
        viewSize.animateShow()
    }
    
    func refresh()
    {
        viewScroll.refresh()
    }
}
