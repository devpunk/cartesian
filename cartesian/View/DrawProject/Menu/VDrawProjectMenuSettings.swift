import UIKit

class VDrawProjectMenuSettings:UIView
{
    private weak var controller:CDrawProject!
    private(set) weak var viewSize:VDrawProjectMenuSettingsSize!
    private let kSizeMargin:CGFloat = 10
    private let kSizeSize:CGFloat = 50
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let viewSize:VDrawProjectMenuSettingsSize = VDrawProjectMenuSettingsSize(
            controller:controller)
        self.viewSize = viewSize
        
        addSubview(viewSize)
        
        NSLayoutConstraint.topToTop(
            view:viewSize,
            toView:self,
            constant:kSizeMargin)
        NSLayoutConstraint.size(
            view:viewSize,
            constant:kSizeSize)
        NSLayoutConstraint.leftToLeft(
            view:viewSize,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
