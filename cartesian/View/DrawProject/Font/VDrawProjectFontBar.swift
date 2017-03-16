import UIKit

class VDrawProjectFontBar:UIView
{
    private weak var controller:CDrawProject!
    private(set) weak var labelTitle:UILabel!
    private let kLabelLeft:CGFloat = 10
    private let kLabelWidth:CGFloat = 200
    private let kBorderHeight:CGFloat = 1
    private let kButtonWidth:CGFloat = 90
    private let kButtonMargin:CGFloat = 10
    private let kCornerRadius:CGFloat = 6
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let labelTitle:UILabel = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.isUserInteractionEnabled = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.font = UIFont.bold(size:14)
        labelTitle.textColor = UIColor(white:0, alpha:0.7)
        self.labelTitle = labelTitle
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.backgroundColor = UIColor.cartesianOrange
        button.layer.cornerRadius = kCornerRadius
        button.setTitleColor(
            UIColor.white,
            for:UIControlState.normal)
        button.setTitleColor(
            UIColor(white:1, alpha:0.2),
            for:UIControlState.highlighted)
        button.setTitle(
            NSLocalizedString("VDrawProjectFontBar_cancel", comment:""),
            for:UIControlState.normal)
        button.titleLabel!.font = UIFont.bold(size:14)
        button.addTarget(
            self,
            action:#selector(actionButton(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let border:VBorder = VBorder(color:UIColor(white:0, alpha:0.1))
        
        addSubview(border)
        addSubview(labelTitle)
        addSubview(button)
        
        NSLayoutConstraint.equalsVertical(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:labelTitle,
            toView:self,
            constant:kLabelLeft)
        NSLayoutConstraint.width(
            view:labelTitle,
            constant:kLabelWidth)
        
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
            view:button,
            toView:self,
            margin:kButtonMargin)
        NSLayoutConstraint.rightToRight(
            view:button,
            toView:self,
            constant:-kButtonMargin)
        NSLayoutConstraint.width(
            view:button,
            constant:kButtonWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionButton(sender button:UIButton)
    {
        controller.viewProject.viewFont?.animateClose()
    }
}
