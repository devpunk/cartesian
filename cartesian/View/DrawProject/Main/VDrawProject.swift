import UIKit

class VDrawProject:VView
{
    private weak var controller:CDrawProject!
    private(set) weak var viewMenu:VDrawProjectMenu!
    private(set) weak var viewScroll:VDrawProjectScroll!
    private(set) weak var viewColor:VDrawProjectColor?
    private(set) weak var viewSize:VDrawProjectSize?
    private(set) weak var viewRotate:VDrawProjectRotate?
    private(set) weak var viewFont:VDrawProjectFont?
    private(set) weak var viewFontSize:VDrawProjectFontSize?
    
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
            constant:self.controller.modelMenuState.kMenuHeight)
        viewMenu.layoutBottom = NSLayoutConstraint.bottomToBottom(
            view:viewMenu,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:viewMenu,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewScroll,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewRules,
            toView:self)
        
        if let menuBottom:CGFloat = self.controller.modelMenuState.current?.bottom
        {
            viewMenu.layoutBottom.constant = menuBottom
        }
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
        viewMenu.viewSettings.viewTitle.updateTitle()
        viewScroll.viewCanvas.draw()
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
    
    func showRotate(node:DNode)
    {
        self.viewRotate?.removeFromSuperview()
        
        let viewRotate:VDrawProjectRotate = VDrawProjectRotate(
            controller:controller,
            node:node)
        self.viewRotate = viewRotate
        
        addSubview(viewRotate)
        
        NSLayoutConstraint.equals(
            view:viewRotate,
            toView:self)
        
        layoutIfNeeded()
        viewRotate.animateShow()
    }
    
    func showFont(title:String, delegate:MDrawProjectFontDelegate)
    {
        self.viewFont?.removeFromSuperview()
        
        let viewFont:VDrawProjectFont = VDrawProjectFont(
            controller:controller,
            delegate:delegate)
        viewFont.viewBar.labelTitle.text = title
        self.viewFont = viewFont
        
        addSubview(viewFont)
        
        NSLayoutConstraint.equals(
            view:viewFont,
            toView:self)
        
        layoutIfNeeded()
        viewFont.animateShow()
    }
    
    func showFontSize(delegate:MDrawProjectFontSizeDelegate)
    {
        self.viewFontSize?.removeFromSuperview()
        
        let viewFontSize:VDrawProjectFontSize = VDrawProjectFontSize(
            controller:controller,
            delegate:delegate)
        self.viewFontSize = viewFontSize
        
        addSubview(viewFontSize)
        
        NSLayoutConstraint.equals(
            view:viewFontSize,
            toView:self)
        
        layoutIfNeeded()
        viewFontSize.animateShow()
    }
    
    func refresh()
    {
        viewScroll.refresh()
    }
}
