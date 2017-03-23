import UIKit

class MDrawProjectShareRender
{
    private static let kZoom:CGFloat = 1
    private static let kMargin:CGFloat = 20
    private static let kSelected:Bool = false
    
    class func renderNode(node:DNode, context:CGContext)
    {
        let margin2:CGFloat = kMargin + kMargin
        let originalX:CGFloat = CGFloat(node.centerX)
        let originalY:CGFloat = CGFloat(node.centerY)
        let widthOriginal:CGFloat = CGFloat(node.width)
        let heightOriginal:CGFloat = CGFloat(node.height)
        let widthOriginal_2:CGFloat = widthOriginal / 2.0
        let heightOriginal_2:CGFloat = heightOriginal / 2.0
        let positionedOriginalX:CGFloat = originalX - widthOriginal_2
        let positionedOriginalY:CGFloat = originalY - heightOriginal_2
        let positionedX:CGFloat = positionedOriginalX - kMargin
        let positionedY:CGFloat = positionedOriginalY - kMargin
        let widthExpanded:CGFloat = widthOriginal + margin2
        let heightExpanded:CGFloat = heightOriginal + margin2
        
        let rect:CGRect = CGRect(
            x:positionedX,
            y:positionedY,
            width:widthExpanded,
            height:heightExpanded)
        
        node.draw(
            rect:rect,
            context:context,
            zoom:kZoom,
            selected:kSelected)
    }
    
    class func renderLabel(label:DLabel, context:CGContext)
    {
        let margin2:CGFloat = kMargin + kMargin
        let originalX:CGFloat = CGFloat(label.centerX)
        let originalY:CGFloat = CGFloat(label.centerY)
        let widthOriginal:CGFloat = CGFloat(label.width)
        let heightOriginal:CGFloat = CGFloat(label.height)
        let widthOriginal_2:CGFloat = widthOriginal / 2.0
        let heightOriginal_2:CGFloat = heightOriginal / 2.0
        let positionedOriginalX:CGFloat = originalX - widthOriginal_2
        let positionedOriginalY:CGFloat = originalY - heightOriginal_2
        let positionedX:CGFloat = positionedOriginalX - kMargin
        let positionedY:CGFloat = positionedOriginalY - kMargin
        let widthExpanded:CGFloat = widthOriginal + margin2
        let heightExpanded:CGFloat = heightOriginal + margin2
        
        let rect:CGRect = CGRect(
            x:positionedX,
            y:positionedY,
            width:widthExpanded,
            height:heightExpanded)
        
        label.draw(
            rect:rect,
            context:context,
            zoom:kZoom,
            selected:kSelected)
    }
}
