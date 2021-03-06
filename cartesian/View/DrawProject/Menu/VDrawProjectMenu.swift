import UIKit

class VDrawProjectMenu:UIView
{
    weak var layoutBottom:NSLayoutConstraint!
    private weak var controller:CDrawProject!
    private(set) weak var viewBar:VDrawProjectMenuBar!
    private(set) weak var viewSettings:VDrawProjectMenuSettings!
    private(set) weak var viewNodes:VDrawProjectMenuNodes!
    private(set) weak var viewLabels:VDrawProjectMenuLabels!
    private(set) weak var viewEdit:VDrawProjectMenuEdit!
    private(set) weak var viewText:VDrawProjectMenuText!
    private let kBarHeight:CGFloat = 51
    private let kKeyboardAnimationDuration:TimeInterval = 0.3
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let viewBar:VDrawProjectMenuBar = VDrawProjectMenuBar(controller:controller)
        self.viewBar = viewBar
        
        let viewSettings:VDrawProjectMenuSettings = VDrawProjectMenuSettings(
            controller:controller)
        viewSettings.isHidden = true
        self.viewSettings = viewSettings
        
        let viewNodes:VDrawProjectMenuNodes = VDrawProjectMenuNodes(
            controller:controller)
        viewNodes.isHidden = true
        self.viewNodes = viewNodes
        
        let viewEdit:VDrawProjectMenuEdit = VDrawProjectMenuEdit(
            controller:controller)
        viewEdit.isHidden = true
        self.viewEdit = viewEdit
        
        let viewLabels:VDrawProjectMenuLabels = VDrawProjectMenuLabels(
            controller:controller)
        viewLabels.isHidden = true
        self.viewLabels = viewLabels
        
        let viewText:VDrawProjectMenuText = VDrawProjectMenuText(
            controller:controller)
        viewText.isHidden = true
        self.viewText = viewText
        
        let background:UIView = UIView()
        background.isUserInteractionEnabled = false
        background.backgroundColor = UIColor.white
        background.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(background)
        addSubview(viewBar)
        addSubview(viewSettings)
        addSubview(viewNodes)
        addSubview(viewLabels)
        addSubview(viewEdit)
        addSubview(viewText)
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:kBarHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
        
        layoutView(view:background)
        layoutView(view:viewSettings)
        layoutView(view:viewNodes)
        layoutView(view:viewLabels)
        layoutView(view:viewEdit)
        layoutView(view:viewText)
        
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(notifiedKeyboardChanged(sender:)),
            name:NSNotification.Name.UIKeyboardWillChangeFrame,
            object:nil)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: notifications
    
    func notifiedKeyboardChanged(sender notification:Notification)
    {
        guard
            
            let userInfo:[AnyHashable:Any] = notification.userInfo,
            let keyboardFrameValue:NSValue = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue,
            let menuBottom:CGFloat = controller.modelMenuState.current?.bottom
            
        else
        {
            return
        }
        
        let keyRect:CGRect = keyboardFrameValue.cgRectValue
        let yOrigin = keyRect.origin.y
        let height:CGFloat = UIScreen.main.bounds.maxY
        let keyboardHeight:CGFloat
        
        if yOrigin < height
        {
            keyboardHeight = -height + yOrigin + menuBottom
        }
        else
        {
            keyboardHeight = menuBottom
        }
        
        layoutBottom.constant = keyboardHeight
        
        UIView.animate(withDuration:kKeyboardAnimationDuration)
        { [weak self] in
            
            self?.layoutIfNeeded()
        }
    }
    
    //MARK: private
    
    private func layoutView(view:UIView)
    {
        NSLayoutConstraint.topToBottom(
            view:view,
            toView:viewBar)
        NSLayoutConstraint.bottomToBottom(
            view:view,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:view,
            toView:self)
    }
    
    //MARK: public
    
    func displayNothing()
    {
        viewSettings.isHidden = true
        viewNodes.isHidden = true
        viewLabels.isHidden = true
        viewEdit.isHidden = true
        viewText.isHidden = true
        
        viewBar.selectNothing()
    }
    
    func displayNode(model:DNode)
    {
        viewSettings.isHidden = true
        viewNodes.isHidden = true
        viewLabels.isHidden = true
        viewEdit.isHidden = false
        viewText.isHidden = true
        
        viewEdit.loadNode(model:model)
        viewBar.modeEdit()
    }
    
    func displaySettings()
    {
        viewSettings.isHidden = false
        viewNodes.isHidden = true
        viewLabels.isHidden = true
        viewEdit.isHidden = true
        viewText.isHidden = true
    }
    
    func displayNodes()
    {
        viewSettings.isHidden = true
        viewNodes.isHidden = false
        viewLabels.isHidden = true
        viewEdit.isHidden = true
        viewText.isHidden = true
    }
    
    func displayLabels()
    {
        viewSettings.isHidden = true
        viewNodes.isHidden = true
        viewLabels.isHidden = false
        viewEdit.isHidden = true
        viewText.isHidden = true
    }
    
    func displayText(model:DLabel)
    {
        viewSettings.isHidden = true
        viewNodes.isHidden = true
        viewLabels.isHidden = true
        viewEdit.isHidden = true
        viewText.isHidden = false
        
        viewText.loadLabel(model:model)
    }
}
