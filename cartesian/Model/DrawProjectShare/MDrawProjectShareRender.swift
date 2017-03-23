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
    
    class func renderLink(link:DLink, context:CGContext)
    {
        guard
            
            let nodeOrigin:DNode = link.origin,
            let nodeDestination:DNode = link.destination
            
        else
        {
            return
        }
        
        let margin2:CGFloat = kMargin + kMargin
        let originX:CGFloat = CGFloat(nodeOrigin.centerX)
        let originY:CGFloat = CGFloat(nodeOrigin.centerY)
        let originWidth:CGFloat = CGFloat(nodeOrigin.width)
        let originHeight:CGFloat = CGFloat(nodeOrigin.height)
        let originWidth_2:CGFloat = originWidth / 2.0
        let originHeight_2:CGFloat = originHeight / 2.0
        let originMinX:CGFloat = originX - originWidth_2
        let originMinY:CGFloat = originY - originHeight_2
        let originMaxX:CGFloat = originX + originWidth_2
        let originMaxY:CGFloat = originY + originHeight_2
        
        let destinationX:CGFloat = CGFloat(nodeDestination.centerX)
        let destinationY:CGFloat = CGFloat(nodeDestination.centerY)
        let destinationWidth:CGFloat = CGFloat(nodeDestination.width)
        let destinationHeight:CGFloat = CGFloat(nodeDestination.height)
        let destinationWidth_2:CGFloat = destinationWidth / 2.0
        let destinationHeight_2:CGFloat = destinationHeight / 2.0
        let destinationMinX:CGFloat = destinationX - destinationWidth_2
        let destinationMinY:CGFloat = destinationY - destinationHeight_2
        let destinationMaxX:CGFloat = destinationX + destinationWidth_2
        let destinationMaxY:CGFloat = destinationY + destinationHeight_2
        
        let minX:CGFloat = min(originMinX, destinationMinX)
        let maxX:CGFloat = max(originMaxX, destinationMaxX)
        let minY:CGFloat = min(originMinY, destinationMinY)
        let maxY:CGFloat = max(originMaxY, destinationMaxY)
        let deltaX:CGFloat = maxX - minX
        let deltaY:CGFloat = maxY - minY
        
        let marginedX:CGFloat = minX - kMargin
        let marginedY:CGFloat = minY - kMargin
        let widthMargin:CGFloat = deltaX + margin2
        let heightMargin:CGFloat = deltaY + margin2
        
        let rect:CGRect = CGRect(
            x:marginedX,
            y:marginedY,
            width:widthMargin,
            height:heightMargin)
        
        link.draw(
            rect:rect,
            context:context,
            zoom:kZoom,
            selected:kSelected)
    }
}
