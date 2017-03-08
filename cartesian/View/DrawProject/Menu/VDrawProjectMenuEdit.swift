import UIKit

class VDrawProjectMenuEdit:UIView
{
    private weak var controller:CDrawProject!
    private weak var viewSpatial:VDrawProjectMenuEditSpatial!
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
        
        addSubview(viewSpatial)
        
        NSLayoutConstraint.equalsVertical(
            view:viewSpatial,
            toView:self)
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
