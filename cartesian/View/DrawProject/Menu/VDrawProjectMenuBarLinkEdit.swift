import UIKit

class VDrawProjectMenuBarLinkEdit:UIView
{
    private weak var controller:CDrawProject!
    private let kLabelLeft:CGFloat = 10
    private let kLabelWidth:CGFloat = 200
    private let kButtonMargin:CGFloat = 10
    private let kButtonWidth:CGFloat = 90
    private let kCornerRadius:CGFloat = 5
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.black
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.font = UIFont.bold(size:14)
        label.textColor = UIColor.white
        label.text = NSLocalizedString("VDrawProjectMenuBarLinkEdit_labelTitle", comment:"")
        
        let buttonDelete:UIButton = UIButton()
        buttonDelete.translatesAutoresizingMaskIntoConstraints = false
        buttonDelete.clipsToBounds = true
        buttonDelete.backgroundColor = UIColor.cartesianOrange
        buttonDelete.setTitleColor(
            UIColor.white,
            for:UIControlState.normal)
        buttonDelete.setTitleColor(
            UIColor(white:1, alpha:0.2),
            for:UIControlState.highlighted)
        buttonDelete.setTitle(
            NSLocalizedString("VDrawProjectMenuBarLinkEdit_buttonDelete", comment:""),
            for:UIControlState.normal)
        buttonDelete.titleLabel!.font = UIFont.bold(size:13)
        buttonDelete.layer.cornerRadius = kCornerRadius
        buttonDelete.addTarget(
            self,
            action:#selector(actionDelete(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let buttonCancel:UIButton = UIButton()
        buttonCancel.translatesAutoresizingMaskIntoConstraints = false
        buttonCancel.clipsToBounds = true
        buttonCancel.backgroundColor = UIColor.cartesianBlue
        buttonCancel.setTitleColor(
            UIColor.white,
            for:UIControlState.normal)
        buttonCancel.setTitleColor(
            UIColor(white:1, alpha:0.2),
            for:UIControlState.highlighted)
        buttonCancel.setTitle(
            NSLocalizedString("VDrawProjectMenuBarLinkEdit_buttonCancel", comment:""),
            for:UIControlState.normal)
        buttonCancel.titleLabel!.font = UIFont.bold(size:13)
        buttonCancel.layer.cornerRadius = kCornerRadius
        buttonCancel.addTarget(
            self,
            action:#selector(actionCancel(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(label)
        addSubview(buttonDelete)
        addSubview(buttonCancel)
        
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
            view:buttonDelete,
            toView:self,
            margin:kButtonMargin)
        NSLayoutConstraint.rightToLeft(
            view:buttonDelete,
            toView:buttonCancel,
            constant:-kButtonMargin)
        NSLayoutConstraint.width(
            view:buttonDelete,
            constant:kButtonWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:buttonCancel,
            toView:self,
            margin:kButtonMargin)
        NSLayoutConstraint.rightToRight(
            view:buttonCancel,
            toView:self,
            constant:-kButtonMargin)
        NSLayoutConstraint.width(
            view:buttonCancel,
            constant:kButtonWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionDelete(sender button:UIButton)
    {
        controller.stopLinking()
    }
    
    func actionCancel(sender button:UIButton)
    {
        controller.stopEdition()
    }
}
