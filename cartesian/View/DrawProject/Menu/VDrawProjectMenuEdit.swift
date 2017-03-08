import UIKit

class VDrawProjectMenuEdit:UIView
{
    private weak var controller:CDrawProject!
    private weak var viewSpatial:VDrawProjectMenuEditSpatial!
    private weak var viewBar:VDrawProjectMenuEditBar!
    private weak var layoutSpatialWidth:NSLayoutConstraint!
    private let kBarHeight:CGFloat = 70
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.white
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let viewSpatial:VDrawProjectMenuEditSpatial = VDrawProjectMenuEditSpatial()
        self.viewSpatial = viewSpatial
        
        let viewBar:VDrawProjectMenuEditBar = VDrawProjectMenuEditBar(
            controller:controller)
        
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
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let height:CGFloat = bounds.maxY
        layoutSpatialWidth.constant = height
        
        super.layoutSubviews()
    }
    
    //MARK: public
    
    func loadNode(model:DNode)
    {
        viewSpatial.model = model
        viewSpatial.setNeedsDisplay()
    }
}
