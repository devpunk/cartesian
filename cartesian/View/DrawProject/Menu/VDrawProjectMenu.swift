import UIKit

class VDrawProjectMenu:UIView
{
    weak var layoutBottom:NSLayoutConstraint!
    private weak var controller:CDrawProject!
    private(set) weak var viewBar:VDrawProjectMenuBar!
    private(set) weak var viewSettings:VDrawProjectMenuSettings!
    private(set) weak var viewNodes:VDrawProjectMenuNodes!
    private(set) weak var viewEdit:VDrawProjectMenuEdit!
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
        
        let background:UIView = UIView()
        background.isUserInteractionEnabled = false
        background.backgroundColor = UIColor.white
        background.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(background)
        addSubview(viewBar)
        addSubview(viewSettings)
        addSubview(viewNodes)
        addSubview(viewEdit)
        
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
        layoutView(view:viewEdit)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
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
        viewEdit.isHidden = true
        viewBar.selectNothing()
    }
    
    func displayNode(model:DNode)
    {
        viewSettings.isHidden = true
        viewNodes.isHidden = true
        viewEdit.isHidden = false
        
        viewEdit.loadNode(model:model)
        viewBar.modeEdit()
    }
    
    func displaySettings()
    {
        viewSettings.isHidden = false
        viewNodes.isHidden = true
        viewEdit.isHidden = true
    }
    
    func displayNodes()
    {
        viewSettings.isHidden = true
        viewNodes.isHidden = false
        viewEdit.isHidden = true
    }
}
