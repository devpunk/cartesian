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
        label.font = UIFont.regular(size:15)
        label.textColor = UIColor.black
        label.text = NSLocalizedString("VDrawProjectMenuBarEdit_label", comment:"")
        
        addSubview(label)
        
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
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
