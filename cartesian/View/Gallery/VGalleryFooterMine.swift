import UIKit

class VGalleryFooterMine:VGalleryFooter
{
    private let kLabelLeft:CGFloat = 5
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.font = UIFont.medium(size:14)
        label.textColor = UIColor.black
        label.text = NSLocalizedString("VGalleryFooterMine_label", comment:"")
        
        addSubview(label)
        
        NSLayoutConstraint.equalsVertical(
            view:label,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:label,
            toView:buttonShare,
            constant:kLabelLeft)
        NSLayoutConstraint.rightToRight(
            view:label,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
