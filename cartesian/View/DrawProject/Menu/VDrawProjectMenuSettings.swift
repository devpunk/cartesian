import UIKit

class VDrawProjectMenuSettings:UIView
{
    private weak var controller:CDrawProject!
    private(set) weak var viewTitle:VDrawProjectMenuSettingsTitle!
    private(set) weak var viewSize:VDrawProjectMenuSettingsSize!
    private(set) weak var viewZoom:VDrawProjectMenuSettingsZoom!
    private(set) weak var viewDefaultColor:VDrawProjectMenuSettingsDefaultColor!
    private(set) weak var viewShare:VDrawProjectMenuSettingsShare!
    private let kTitleHeight:CGFloat = 55
    private let kShareWidth:CGFloat = 60
    private let kSizeWidth:CGFloat = 110
    private let kZoomWidth:CGFloat = 115
    private let kDefaultColorWidth:CGFloat = 85
    
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
        
        let viewShare:VDrawProjectMenuSettingsShare = VDrawProjectMenuSettingsShare(
            controller:controller)
        self.viewShare = viewShare
        
        addSubview(viewTitle)
        addSubview(viewSize)
        addSubview(viewZoom)
        addSubview(viewDefaultColor)
        addSubview(viewShare)
        
        NSLayoutConstraint.topToTop(
            view:viewTitle,
            toView:self)
        NSLayoutConstraint.height(
            view:viewTitle,
            constant:kTitleHeight)
        NSLayoutConstraint.rightToLeft(
            view:viewTitle,
            toView:viewShare)
        NSLayoutConstraint.leftToLeft(
            view:viewTitle,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:viewSize,
            toView:viewTitle)
        NSLayoutConstraint.bottomToBottom(
            view:viewSize,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:viewSize,
            toView:self)
        NSLayoutConstraint.width(
            view:viewSize,
            constant:kSizeWidth)
        
        NSLayoutConstraint.topToBottom(
            view:viewZoom,
            toView:viewTitle)
        NSLayoutConstraint.bottomToBottom(
            view:viewZoom,
            toView:self)
        NSLayoutConstraint.leftToRight(
            view:viewZoom,
            toView:viewSize)
        NSLayoutConstraint.width(
            view:viewZoom,
            constant:kZoomWidth)
        
        NSLayoutConstraint.topToBottom(
            view:viewDefaultColor,
            toView:viewTitle)
        NSLayoutConstraint.bottomToBottom(
            view:viewDefaultColor,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:viewDefaultColor,
            toView:self)
        NSLayoutConstraint.width(
            view:viewDefaultColor,
            constant:kDefaultColorWidth)
        
        NSLayoutConstraint.topToTop(
            view:viewShare,
            toView:self)
        NSLayoutConstraint.height(
            view:viewShare,
            constant:kTitleHeight)
        NSLayoutConstraint.rightToRight(
            view:viewShare,
            toView:self)
        NSLayoutConstraint.width(
            view:viewShare,
            constant:kShareWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
