import UIKit

class VDrawProject:VView
{
    private weak var controller:CDrawProject!
    private(set) weak var viewMenu:VDrawProjectMenu!
    private weak var layoutMenuBottom:NSLayoutConstraint!
    private let kMenuHeight:CGFloat = 251
    private let kMenuMaxBottom:CGFloat = 200
    
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
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:viewMenu,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
