import UIKit

class VDrawProjectMenuBarEdit:UIView
{
    private weak var controller:CDrawProject!
    private let kButtonMargin:CGFloat = 10
    private let kButtonWidth:CGFloat = 100
    private let kLabelWidth:CGFloat = 200
    private let kLabelLeft:CGFloat = 10
    private let kCornerRadius:CGFloat = 5
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.font = UIFont.bold(size:14)
        label.textColor = UIColor.black
        label.text = NSLocalizedString("VDrawProjectMenuBarEdit_label", comment:"")
        
        let button:UIButton = UIButton()
        button.clipsToBounds = true
        button.backgroundColor = UIColor.cartesianBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(
            UIColor.white,
            for:UIControlState.normal)
        button.setTitleColor(
            UIColor(white:1, alpha:0.2),
            for:UIControlState.highlighted)
        button.setTitle(
            NSLocalizedString("VDrawProjectMenuBarEdit_button", comment:""),
            for:UIControlState.normal)
        button.titleLabel!.font = UIFont.bold(size:14)
        button.layer.cornerRadius = kCornerRadius
        button.addTarget(
            self,
            action:#selector(actionButton(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(label)
        addSubview(button)
        
        NSLayoutConstraint.equalsVertical(
            view:label,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:label,
            toView:self,
            constant:kLabelLeft)
        NSLayoutConstraint.width(
            view:label,
            constant:kLabelWidth)
        
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
        controller.stopEdition()
    }
}
