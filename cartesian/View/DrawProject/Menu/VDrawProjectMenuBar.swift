import UIKit

class VDrawProjectMenuBar:UIView
{
    private(set) weak var viewEdit:VDrawProjectMenuBarEdit!
    private(set) weak var viewMove:VDrawProjectMenuBarMove!
    private(set) weak var viewText:VDrawProjectMenuBarText!
    private weak var controller:CDrawProject!
    private weak var buttonSettings:VDrawProjectMenuBarButton!
    private weak var buttonNodes:VDrawProjectMenuBarButton!
    private weak var layoutBackLeft:NSLayoutConstraint!
    private weak var layoutTextTop:NSLayoutConstraint!
    private weak var layoutTextWidth:NSLayoutConstraint!
    private let kButtonWidth:CGFloat = 60
    private let kBorderHeight:CGFloat = 1
    private let kTextHeight:CGFloat = 34
    private let kTextMinWidth:CGFloat = 10
    private let kTextMaxWidth:CGFloat = 150
    private let kTextRight:CGFloat = -10
    private let kAnimationDuration:TimeInterval = 0.3
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let blur:VBlur = VBlur.light()
        let border:VBorder = VBorder(color:UIColor(white:0, alpha:0.1))
        
        let buttonBack:VDrawProjectMenuBarButton = VDrawProjectMenuBarButton(
            image:#imageLiteral(resourceName: "assetGenericBack"))
        buttonBack.addTarget(
            self,
            action:#selector(actionBack(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let buttonSettings:VDrawProjectMenuBarButton = VDrawProjectMenuBarButton(
            image:#imageLiteral(resourceName: "assetGenericSettings"))
        buttonSettings.addTarget(
            self,
            action:#selector(actionSettings(sender:)),
            for:UIControlEvents.touchUpInside)
        self.buttonSettings = buttonSettings
        
        let buttonNodes:VDrawProjectMenuBarButton = VDrawProjectMenuBarButton(
            image:#imageLiteral(resourceName: "assetGenericNodes"))
        buttonNodes.addTarget(
            self,
            action:#selector(actionNodes(sender:)),
            for:UIControlEvents.touchUpInside)
        self.buttonNodes = buttonNodes
        
        let viewEdit:VDrawProjectMenuBarEdit = VDrawProjectMenuBarEdit(
            controller:controller)
        viewEdit.alpha = 0
        self.viewEdit = viewEdit
        
        let viewMove:VDrawProjectMenuBarMove = VDrawProjectMenuBarMove(
            controller:controller)
        viewMove.alpha = 0
        self.viewMove = viewMove
        
        let viewText:VDrawProjectMenuBarText = VDrawProjectMenuBarText(
            controller:controller)
        viewText.layer.cornerRadius = kTextHeight / 2.0
        viewText.alpha = 0
        self.viewText = viewText
        
        addSubview(blur)
        addSubview(border)
        addSubview(buttonBack)
        addSubview(buttonSettings)
        addSubview(buttonNodes)
        addSubview(viewEdit)
        addSubview(viewMove)
        addSubview(viewText)
        
        NSLayoutConstraint.equals(
            view:blur,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.equalsVertical(
            view:buttonBack,
            toView:self)
        layoutBackLeft = NSLayoutConstraint.leftToLeft(
            view:buttonBack,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonBack,
            constant:kButtonWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:buttonSettings,
            toView:self)
        NSLayoutConstraint.leftToRight(
            view:buttonSettings,
            toView:buttonBack)
        NSLayoutConstraint.width(
            view:buttonSettings,
            constant:kButtonWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:buttonNodes,
            toView:self)
        NSLayoutConstraint.leftToRight(
            view:buttonNodes,
            toView:buttonSettings)
        NSLayoutConstraint.width(
            view:buttonNodes,
            constant:kButtonWidth)
        
        NSLayoutConstraint.equals(
            view:viewEdit,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewMove,
            toView:self)
        
         layoutTextTop = NSLayoutConstraint.topToTop(
            view:viewText,
            toView:self)
        NSLayoutConstraint.height(
            view:viewText,
            constant:kTextHeight)
        NSLayoutConstraint.rightToRight(
            view:viewText,
            toView:self,
            constant:kTextRight)
        layoutTextWidth = NSLayoutConstraint.width(
            view:viewText,
            constant:kTextMinWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionBack(sender button:UIButton)
    {
        controller.back()
    }
    
    func actionSettings(sender button:UIButton)
    {
        if !buttonSettings.isSelected
        {
            selectSettings()
        }
    }
    
    func actionNodes(sender button:UIButton)
    {
        if !buttonNodes.isSelected
        {
            selectNodes()
        }
    }
    
    //MARK: private
    
    private func hideButtons()
    {
        let width:CGFloat = bounds.width
        layoutBackLeft.constant = -width
        
        UIView.animate(withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.layoutIfNeeded()
        }
    }
    
    private func showButtons()
    {
        layoutBackLeft.constant = 0
        
        UIView.animate(withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.layoutIfNeeded()
        }
    }
    
    //MARK: public
    
    func selectSettings()
    {
        buttonSettings.isSelected = true
        buttonNodes.isSelected = false
        controller.viewProject.viewMenu.displaySettings()
        controller.modelMenuState.current?.show()
    }
    
    func selectNodes()
    {
        buttonSettings.isSelected = false
        buttonNodes.isSelected = true
        controller.viewProject.viewMenu.displayNodes()
        controller.modelMenuState.current?.show()
    }
    
    func selectNothing()
    {
        buttonSettings.isSelected = false
        buttonNodes.isSelected = false
        showButtons()
        viewEdit.alpha = 0
        viewMove.alpha = 0
    }
    
    func modeEdit()
    {
        hideButtons()
        
        UIView.animate(withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.viewEdit.alpha = 1
            self?.viewMove.alpha = 0
        }
    }
    
    func modeMove()
    {
        hideButtons()
        
        UIView.animate(withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.viewEdit.alpha = 0
            self?.viewMove.alpha = 1
        }
    }
    
    func modeNormal()
    {
        showButtons()
        selectNodes()
        
        UIView.animate(withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.viewEdit.alpha = 0
            self?.viewMove.alpha = 0
        }
    }
}
