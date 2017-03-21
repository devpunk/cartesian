import UIKit

class VDrawProjectCanvasView:UIView
{
    private(set) weak var controller:CDrawProject!
    private(set) weak var viewSpatial:VDrawProjectCanvasViewSpatial!
    let margin2:CGFloat
    let kMargin:CGFloat = 20
    var selected:Bool
    
    required init(
        controller:CDrawProject,
        model:DDrawable)
    {
        margin2 = kMargin + kMargin
        selected = false
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        self.controller = controller
        
        let viewSpatial:VDrawProjectCanvasViewSpatial = VDrawProjectCanvasViewSpatial(
            model:model,
            viewCanvas:self)
        self.viewSpatial = viewSpatial
        
        addSubview(viewSpatial)
        
        NSLayoutConstraint.equals(
            view:viewSpatial,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func draw(_ rect:CGRect)
    {
        viewSpatial.setNeedsDisplay()
    }
    
    //MARK: public
    
    func positionCenter()
    {
    }
    
    func startEditing()
    {
        selected = true
        setNeedsDisplay()
    }
    
    func stopEditing()
    {
        selected = false
        setNeedsDisplay()
    }
}
