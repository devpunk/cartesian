import UIKit

class VDrawProjectMenuSettings:UIView
{
    private weak var controller:CDrawProject!
    private(set) weak var viewTitle:VDrawProjectMenuSettingsTitle!
    private(set) weak var viewSize:VDrawProjectMenuSettingsSize!
    private(set) weak var viewZoom:VDrawProjectMenuSettingsZoom!
    private(set) weak var viewDefaultColor:VDrawProjectMenuSettingsDefaultColor!
    private let kSizeMargin:CGFloat = 10
    private let kSizeWidth:CGFloat = 110
    private let kSizeHeight:CGFloat = 55
    private let kZoomWidth:CGFloat = 115
    private let kZoomHeight:CGFloat = 50
    private let kTitleHeight:CGFloat = 55
    private let kDefaultColorTop:CGFloat = 18
    private let kDefaultColorHeight:CGFloat = 36
    private let kDefaultColorWidth:CGFloat = 80
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let viewTitle:VDrawProjectMenuSettingsTitle = VDrawProjectMenuSettingsTitle(
            controller:controller)
        self.viewTitle = viewTitle
        
        let viewSize:VDrawProjectMenuSettingsSize = VDrawProjectMenuSettingsSize(
            controller:controller)
        self.viewSize = viewSize
        
        let viewZoom:VDrawProjectMenuSettingsZoom = VDrawProjectMenuSettingsZoom(
            controller:controller)
        self.viewZoom = viewZoom
        
        let viewDefaultColor:VDrawProjectMenuSettingsDefaultColor = VDrawProjectMenuSettingsDefaultColor(
            controller:controller)
        self.viewDefaultColor = viewDefaultColor
        
        addSubview(viewTitle)
        addSubview(viewSize)
        addSubview(viewZoom)
        addSubview(viewDefaultColor)
        
        NSLayoutConstraint.topToTop(
            view:viewTitle,
            toView:self)
        NSLayoutConstraint.height(
            view:viewTitle,
            constant:kTitleHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewTitle,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:viewSize,
            toView:viewTitle,
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
        
        NSLayoutConstraint.topToBottom(
            view:viewZoom,
            toView:viewTitle)
        NSLayoutConstraint.height(
            view:viewZoom,
            constant:kZoomHeight)
        NSLayoutConstraint.rightToRight(
            view:viewZoom,
            toView:self)
        NSLayoutConstraint.width(
            view:viewZoom,
            constant:kZoomWidth)
        
        NSLayoutConstraint.topToBottom(
            view:viewDefaultColor,
            toView:viewSize,
            constant:kDefaultColorTop)
        NSLayoutConstraint.height(
            view:viewDefaultColor,
            constant:kDefaultColorHeight)
        NSLayoutConstraint.leftToLeft(
            view:viewDefaultColor,
            toView:self)
        NSLayoutConstraint.width(
            view:viewDefaultColor,
            constant:kDefaultColorWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
