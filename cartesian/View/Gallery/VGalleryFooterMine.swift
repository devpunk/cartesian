import UIKit

class VGalleryFooterMine:VGalleryFooter
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.font = UIFont.medium(size:12)
        label.textColor = UIColor.black
        label.text = NSLocalizedString("VGalleryFooterMine_label", comment:"")
        
        addSubview(label)
        
        NSLayoutConstraint.topToTop(
            view:label,
            toView:self,
            constant:kButtonTop)
        NSLayoutConstraint.height(
            view:label,
            constant:kButtonHeight)
        NSLayoutConstraint.leftToRight(
            view:label,
            toView:buttonShare)
        NSLayoutConstraint.rightToRight(
            view:label,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
