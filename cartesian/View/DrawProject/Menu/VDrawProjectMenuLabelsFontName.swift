import UIKit

class VDrawProjectMenuLabelsFontName:UIButton
{
    private weak var controller:CDrawProject!
    private let kTitleBaseWidth:CGFloat = 40
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let titleBase:UIView = UIView()
        titleBase.isUserInteractionEnabled = false
        titleBase.translatesAutoresizingMaskIntoConstraints = false
        titleBase.backgroundColor = UIColor.cartesianBlue
        
        let labelTitle:UILabel = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.isUserInteractionEnabled = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.font = UIFont.bold(size:14)
        labelTitle.textColor = UIColor.white
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.text = NSLocalizedString("VDrawProjectMenuLabelsFontName_labelTitle", comment:"")
        
        titleBase.addSubview(labelTitle)
        addSubview(titleBase)
        
        NSLayoutConstraint.equalsVertical(
            view:titleBase,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:titleBase,
            toView:self)
        NSLayoutConstraint.width(
            view:titleBase,
            constant:kTitleBaseWidth)
        
        NSLayoutConstraint.equals(
            view:labelTitle,
            toView:titleBase)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
