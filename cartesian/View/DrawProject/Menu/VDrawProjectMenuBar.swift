import UIKit

class VDrawProjectMenuBar:UIView
{
    private(set) weak var controller:CDrawProject!
    private weak var buttonSettings:UIButton!
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
        
        let buttonBack:UIButton = UIButton()
        buttonBack.translatesAutoresizingMaskIntoConstraints = false
        buttonBack.setImage(
            #imageLiteral(resourceName: "assetGenericBack").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.normal)
        buttonBack.setImage(
            #imageLiteral(resourceName: "assetGenericBack").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.highlighted)
        buttonBack.imageView!.clipsToBounds = true
        buttonBack.imageView!.contentMode = UIViewContentMode.center
        buttonBack.imageView!.tintColor = UIColor(white:0, alpha:0.2)
        buttonBack.addTarget(
            self,
            action:#selector(actionBack(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let buttonSettings:UIButton = UIButton()
        buttonSettings.translatesAutoresizingMaskIntoConstraints = false
        buttonSettings.setImage(
            #imageLiteral(resourceName: "assetGenericSettings").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.selected)
        buttonSettings.setImage(
            #imageLiteral(resourceName: "assetGenericSettings").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.highlighted)
        buttonSettings.setImage(
            #imageLiteral(resourceName: "assetGenericSettings").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.normal)
        buttonSettings
        
        addSubview(border)
        addSubview(buttonBack)
        
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
