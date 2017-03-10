import UIKit

class VDrawProjectMenuEdit:UIView
{
    private weak var controller:CDrawProject!
    private weak var viewSpatial:VDrawProjectMenuEditSpatial!
    private weak var viewInfo:VDrawProjectMenuEditInfo!
    private weak var viewBar:VDrawProjectMenuEditBar!
    private weak var layoutSpatialWidth:NSLayoutConstraint!
    private let kBarHeight:CGFloat = 90
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let viewSpatial:VDrawProjectMenuEditSpatial = VDrawProjectMenuEditSpatial(
            controller:controller)
        self.viewSpatial = viewSpatial
        
        let viewInfo:VDrawProjectMenuEditInfo = VDrawProjectMenuEditInfo()
        self.viewInfo = viewInfo
        
        let viewBar:VDrawProjectMenuEditBar = VDrawProjectMenuEditBar(
            controller:controller)
        
        addSubview(viewInfo)
        addSubview(viewSpatial)
        addSubview(viewBar)

        NSLayoutConstraint.bottomToBottom(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:kBarHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:viewSpatial,
            toView:self)
        NSLayoutConstraint.bottomToTop(
            view:viewSpatial,
            toView:viewBar)
        NSLayoutConstraint.leftToLeft(
            view:viewSpatial,
            toView:self)
        layoutSpatialWidth = NSLayoutConstraint.width(
            view:viewSpatial)
        
        NSLayoutConstraint.topToTop(
            view:viewInfo,
            toView:self)
        NSLayoutConstraint.leftToRight(
            view:viewInfo,
            toView:viewSpatial)
        NSLayoutConstraint.rightToRight(
            view:viewInfo,
            toView:self)
        NSLayoutConstraint.bottomToTop(
            view:viewInfo,
            toView:viewBar)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let spatialHeight:CGFloat = bounds.maxY - kBarHeight
        layoutSpatialWidth.constant = spatialHeight
        
        super.layoutSubviews()
    }
    
    //MARK: public
    
    func loadNode(model:DNode)
    {
        viewSpatial.model = model
        viewSpatial.setNeedsDisplay()
        viewInfo.showInfo(model:model)
    }
}
