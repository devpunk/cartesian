import UIKit

class VDrawProjectMenuSettings:UIView
{
    private weak var controller:CDrawProject!
    private(set) weak var viewSize:VDrawProjectMenuSettingsSize!
    private(set) weak var viewZoom:VDrawProjectMenuSettingsZoom!
    private let kSizeMargin:CGFloat = 10
    private let kSizeWidth:CGFloat = 110
    private let kSizeHeight:CGFloat = 55
    private let kZoomWidth:CGFloat = 115
    private let kZoomHeight:CGFloat = 50
    
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
        
        let viewZoom:VDrawProjectMenuSettingsZoom = VDrawProjectMenuSettingsZoom(
            controller:controller)
        self.viewZoom = viewZoom
        
        addSubview(viewSize)
        addSubview(viewZoom)
        
        NSLayoutConstraint.topToTop(
            view:viewSize,
            toView:self,
            constant:kSizeMargin)
        NSLayoutConstraint.height(
            view:viewSize,
            constant:kSizeHeight)
        NSLayoutConstraint.leftToLeft(
            view:viewSize,
            toView:self,
            constant:kSizeMargin)
        NSLayoutConstraint.width(
            view:viewSize,
            constant:kSizeWidth)
        
        NSLayoutConstraint.topToTop(
            view:viewZoom,
            toView:self)
        NSLayoutConstraint.height(
            view:viewZoom,
            constant:kZoomHeight)
        NSLayoutConstraint.rightToRight(
            view:viewZoom,
            toView:self)
        NSLayoutConstraint.width(
            view:viewZoom,
            constant:kZoomWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
