import UIKit

class VStoreCellNotAvailable:VStoreCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        backgroundColor = UIColor.clear
        isUserInteractionEnabled = false
        
        let label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.regular(size:14)
        label.textColor = UIColor(white:0.5, alpha:1)
        label.text = NSLocalizedString("VStoreCellNotAvailable_label", comment:"")
        
        addSubview(label)
        
        NSLayoutConstraint.equals(
            view:label,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
