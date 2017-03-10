import UIKit

class VDrawProjectMenuSettingsTitle:UIView
{
    private weak var controller:CDrawProject!
    private weak var labelName:UILabel!
    private let kLabelLeft:CGFloat = 10
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        
        let labelTitle:UILabel = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.isUserInteractionEnabled = false
        
        let labelName:UILabel = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.backgroundColor = UIColor.clear
        labelName.isUserInteractionEnabled = false
        labelName.font = UIFont.regular(size:18)
        labelName.textColor = UIColor(white:0, alpha:0.8)
        self.labelName = labelName
        
        addSubview(labelTitle)
        addSubview(labelName)
        
        NSLayoutConstraint.equalsVertical(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:labelTitle,
            toView:self,
            constant:kLabelLeft)
        NSLayoutConstraint.width(
            view:labelTitle)
        
        NSLayoutConstraint.equalsVertical(
            view:labelName,
            toView:self)
        NSLayoutConstraint.leftToRight(
            view:labelName,
            toView:labelTitle)
        NSLayoutConstraint.rightToRight(
            view:labelName,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
