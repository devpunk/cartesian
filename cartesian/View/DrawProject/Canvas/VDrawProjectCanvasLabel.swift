import UIKit

class VDrawProjectCanvasLabel:VDrawProjectCanvasView
{
    override init(
        controller:CDrawProject,
        model:DDrawable)
    {
        super.init(
            controller:controller,
            model:model)
        
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(self.notifiedLabelDraw(sender:)),
            name:Notification.labelDraw,
            object:nil)
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
    
    override func positionCenter()
    {
        guard
            
            let model:DLabel = viewSpatial.model as? DLabel
            
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
    
    //MARK: notifications
    
    func notifiedLabelDraw(sender notification:Notification)
    {
        guard
            
            let labelSender:DLabel = notification.object as? DLabel,
            let currentLabel:DLabel = viewSpatial.model as? DLabel
            
        else
        {
            return
        }
        
        if currentLabel === labelSender
        {
            positionCenter()
            layoutIfNeeded()
            setNeedsDisplay()
        }
    }
}
