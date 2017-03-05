import UIKit

class VDrawProjectMenuBar:UIView
{
    private(set) weak var controller:CDrawProject!
    private weak var buttonSettings:VDrawProjectMenuBarButton!
    private weak var layoutBackLeft:NSLayoutConstraint!
    private let kButtonWidth:CGFloat = 60
    private let kBorderHeight:CGFloat = 1
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let border:VBorder = VBorder(color:UIColor(white:0, alpha:0.1))
        
        let buttonBack:VDrawProjectMenuBarButton = VDrawProjectMenuBarButton(
            image:#imageLiteral(resourceName: "assetGenericBack"))
        buttonBack.addTarget(
            self,
            action:#selector(actionBack(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let buttonSettings:VDrawProjectMenuBarButton = VDrawProjectMenuBarButton(
            image:#imageLiteral(resourceName: "assetGenericSettings"))
        self.buttonSettings = buttonSettings
        
        addSubview(border)
        addSubview(buttonBack)
        addSubview(buttonSettings)
        
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
}
