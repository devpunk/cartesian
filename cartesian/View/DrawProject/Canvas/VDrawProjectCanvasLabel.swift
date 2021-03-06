import UIKit

class VDrawProjectCanvasLabel:VDrawProjectCanvasView
{
    required init(
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
    
    override func positionCenter()
    {
        guard
            
            let model:DLabel = viewSpatial.model as? DLabel
            
        else
        {
            return
        }
        
        let zoom:CGFloat = controller.modelZoom.currentZoom()
        let originalX:CGFloat = CGFloat(model.centerX)
        let originalY:CGFloat = CGFloat(model.centerY)
        let zoomedX:CGFloat = originalX * zoom
        let zoomedY:CGFloat = originalY * zoom
        let widthOriginal:CGFloat = CGFloat(model.width)
        let heightOriginal:CGFloat = CGFloat(model.height)
        let widthOriginal_2:CGFloat = widthOriginal / 2.0
        let heightOriginal_2:CGFloat = heightOriginal / 2.0
        let positionedOriginalX:CGFloat = zoomedX - widthOriginal_2
        let positionedOriginalY:CGFloat = zoomedY - heightOriginal_2
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
            fullRedraw()
        }
    }
}
