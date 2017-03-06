import UIKit

class VDrawProjectMenuSettingsSize:UIView
{
    private weak var controller:CDrawProject!
    private let kIconSize:CGFloat = 30
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        
        let icon:UIImageView = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.isUserInteractionEnabled = false
        icon.image = #imageLiteral(resourceName: "assetGenericSize")
        icon.contentMode = UIViewContentMode.center
        icon.clipsToBounds = true
        
        addSubview(icon)
        
        NSLayoutConstraint.topToTop(
            view:icon,
            toView:self)
        NSLayoutConstraint.size(
            view:icon,
            constant:kIconSize)
        NSLayoutConstraint.leftToLeft(
            view:icon,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
