import UIKit

class VDrawProjectCanvasLabel:UIView
{
    private(set) weak var viewSpatial:VDrawProjectCanvasLabelSpatial!
    private weak var controller:CDrawProject!
    private let margin2:CGFloat
    private let kMargin:CGFloat = 20
    
    init(
        controller:CDrawProject,
        model:DLabel)
    {
        margin2 = kMargin + kMargin
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        self.controller = controller
        
        let viewSpatial:VDrawProjectCanvasLabelSpatial = VDrawProjectCanvasLabelSpatial(
            controller:controller,
            model:model)
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
    
    override func draw(_ rect:CGRect)
    {
        viewSpatial.setNeedsDisplay()
    }
    
    //MARK: notifications
    
    func notifiedLabelDraw(sender notification:Notification)
    {
        guard
            
            let labelSender:DLabel = notification.object as? DLabel,
            let currentLabel:DLabel = viewSpatial.model
            
        else
        {
            return
        }
        
        if currentLabel === labelSender
        {
            centerLabel()
            layoutIfNeeded()
        }
    }
    
    //MARK: public
    
    func centerLabel()
    {
        guard
            
            let model:DLabel = self.viewSpatial.model
            
        else
        {
            return
        }
        
        let originalX:CGFloat = CGFloat(model.centerX)
        let originalY:CGFloat = CGFloat(model.centerY)
        let widthOriginal:CGFloat = CGFloat(model.width)
        let heightOriginal:CGFloat = CGFloat(model.height)
        let widthOriginal_2:CGFloat = widthOriginal / 2.0
        let heightOriginal_2:CGFloat = heightOriginal / 2.0
        let positionedOriginalX:CGFloat = originalX - widthOriginal_2
        let positionedOriginalY:CGFloat = originalY - heightOriginal_2
        let positionedX:CGFloat = positionedOriginalX - kMargin
        let positionedY:CGFloat = positionedOriginalY - kMargin
        let widthExpanded:CGFloat = widthOriginal + margin2
        let heightExpanded:CGFloat = heightOriginal + margin2
        
        frame = CGRect(
            x:positionedX,
            y:positionedY,
            width:widthExpanded,
            height:heightExpanded)
    }
    
    func startSelected()
    {
        viewSpatial.selected = true
        setNeedsDisplay()
    }
    
    func endSelected()
    {
        viewSpatial.selected = false
        setNeedsDisplay()
    }
    
    func startMoving()
    {
        viewSpatial.selected = true
        setNeedsDisplay()
    }
    
    func stopMoving()
    {
        viewSpatial.selected = false
        setNeedsDisplay()
    }
}
