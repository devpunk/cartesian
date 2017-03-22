import UIKit

class VDrawProjectMenuBar:UIView
{
    private(set) weak var viewEdit:VDrawProjectMenuBarEdit!
    private(set) weak var viewMove:VDrawProjectMenuBarMove!
    private(set) weak var viewText:VDrawProjectMenuBarText!
    private(set) weak var viewLink:VDrawProjectMenuBarLink!
    private(set) weak var viewLinkEdit:VDrawProjectMenuBarLinkEdit!
    private weak var controller:CDrawProject!
    private weak var buttonSettings:VDrawProjectMenuBarButton!
    private weak var buttonNodes:VDrawProjectMenuBarButton!
    private weak var buttonLabels:VDrawProjectMenuBarButton!
    private weak var layoutBackLeft:NSLayoutConstraint!
    private weak var layoutTextLeft:NSLayoutConstraint!
    private var showingText:Bool
    private let kButtonWidth:CGFloat = 60
    private let kBorderHeight:CGFloat = 1
    private let kAnimationDuration:TimeInterval = 0.3
    private let kAfterKeyboardAppear:TimeInterval = 0.1
    
    init(controller:CDrawProject)
    {
        showingText = false
        
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
        
        let buttonLabels:VDrawProjectMenuBarButton = VDrawProjectMenuBarButton(
            image:#imageLiteral(resourceName: "assetGenericLabels"))
        buttonLabels.addTarget(
            self,
            action:#selector(actionLabels(sender:)),
            for:UIControlEvents.touchUpInside)
        self.buttonLabels = buttonLabels
        
        let viewEdit:VDrawProjectMenuBarEdit = VDrawProjectMenuBarEdit(
            controller:controller)
        viewEdit.alpha = 0
        self.viewEdit = viewEdit
        
        let viewMove:VDrawProjectMenuBarMove = VDrawProjectMenuBarMove(
            controller:controller)
        viewMove.alpha = 0
        self.viewMove = viewMove
        
        let viewLink:VDrawProjectMenuBarLink = VDrawProjectMenuBarLink(
            controller:controller)
        viewLink.alpha = 0
        self.viewLink = viewLink
        
        let viewLinkEdit:VDrawProjectMenuBarLinkEdit = VDrawProjectMenuBarLinkEdit(
            controller:controller)
        viewLinkEdit.alpha = 0
        self.viewLinkEdit = viewLinkEdit
        
        let viewText:VDrawProjectMenuBarText = VDrawProjectMenuBarText(
            controller:controller)
        self.viewText = viewText
        
        addSubview(blur)
        addSubview(border)
        addSubview(buttonBack)
        addSubview(buttonSettings)
        addSubview(buttonNodes)
        addSubview(buttonLabels)
        addSubview(viewEdit)
        addSubview(viewMove)
        addSubview(viewLink)
        addSubview(viewLinkEdit)
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
        
        NSLayoutConstraint.equalsVertical(
            view:buttonLabels,
            toView:self)
        NSLayoutConstraint.leftToRight(
            view:buttonLabels,
            toView:buttonNodes)
        NSLayoutConstraint.width(
            view:buttonLabels,
            constant:kButtonWidth)
        
        NSLayoutConstraint.equals(
            view:viewEdit,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewMove,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewLink,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewLinkEdit,
            toView:self)
        
         NSLayoutConstraint.equalsVertical(
            view:viewText,
            toView:self)
        NSLayoutConstraint.width(
            view:viewText,
            toView:self)
        layoutTextLeft = NSLayoutConstraint.leftToRight(
            view:viewText,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        if showingText
        {
            let width:CGFloat = bounds.maxX
            layoutTextLeft.constant = -width
        }
        else
        {
            layoutTextLeft.constant = 0
        }
        
        super.layoutSubviews()
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
    
    func actionLabels(sender button:UIButton)
    {
        if !buttonLabels.isSelected
        {
            selectLabels()
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
        buttonLabels.isSelected = false
        controller.viewProject.viewMenu.displaySettings()
        controller.modelMenuState.current?.show()
    }
    
    func selectNodes()
    {
        buttonSettings.isSelected = false
        buttonNodes.isSelected = true
        buttonLabels.isSelected = false
        controller.viewProject.viewMenu.displayNodes()
        controller.modelMenuState.current?.show()
    }
    
    func selectLabels()
    {
        buttonSettings.isSelected = false
        buttonNodes.isSelected = false
        buttonLabels.isSelected = true
        controller.viewProject.viewMenu.displayLabels()
        controller.modelMenuState.current?.show()
    }
    
    func selectNothing()
    {
        buttonSettings.isSelected = false
        buttonNodes.isSelected = false
        buttonLabels.isSelected = false
        showButtons()
        viewEdit.alpha = 0
        viewMove.alpha = 0
        viewLink.alpha = 0
        viewLinkEdit.alpha = 0
    }
    
    func modeEdit()
    {
        showingText = false
        setNeedsLayout()
        hideButtons()
        
        UIView.animate(withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.viewEdit.alpha = 1
            self?.viewMove.alpha = 0
            self?.viewLink.alpha = 0
            self?.viewLinkEdit.alpha = 0
        }
    }
    
    func modeMove()
    {
        showingText = false
        setNeedsLayout()
        hideButtons()
        
        UIView.animate(withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.viewEdit.alpha = 0
            self?.viewMove.alpha = 1
            self?.viewLink.alpha = 0
            self?.viewLinkEdit.alpha = 0
        }
    }
    
    func modeLink()
    {
        showingText = false
        setNeedsLayout()
        hideButtons()
        
        UIView.animate(withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.viewEdit.alpha = 0
            self?.viewMove.alpha = 0
            self?.viewLink.alpha = 1
            self?.viewLinkEdit.alpha = 0
        }
    }
    
    func modeLinkEdit()
    {
        showingText = false
        setNeedsLayout()
        hideButtons()
        
        UIView.animate(withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.viewEdit.alpha = 0
            self?.viewMove.alpha = 0
            self?.viewLink.alpha = 0
            self?.viewLinkEdit.alpha = 1
        }
    }
    
    func modeText(delegate:UITextFieldDelegate)
    {
        showingText = true
        setNeedsLayout()
        hideButtons()
        viewText.textField.delegate = delegate
        
        DispatchQueue.main.asyncAfter(
            deadline:DispatchTime.now() + kAfterKeyboardAppear)
        { [weak self] in
            
            self?.viewText.textField.becomeFirstResponder()
        }
        
        UIView.animate(withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.viewEdit.alpha = 0
            self?.viewMove.alpha = 0
            self?.viewLink.alpha = 0
            self?.viewLinkEdit.alpha = 0
        }
    }
    
    func modeNormal()
    {
        showingText = false
        setNeedsLayout()
        showButtons()
        selectNodes()
        
        UIView.animate(withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.viewEdit.alpha = 0
            self?.viewMove.alpha = 0
            self?.viewLink.alpha = 0
            self?.viewLinkEdit.alpha = 0
        }
    }
}
