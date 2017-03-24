import UIKit
import CoreData

extension DNodeInputOutput
{
    override func drawPaths(
        rect:CGRect,
        context:CGContext,
        zoom:CGFloat)
    {
        var modelWidth:CGFloat = CGFloat(self.width)
        var modelHeight:CGFloat = CGFloat(self.height)
        let originX:CGFloat = rect.origin.x
        let originY:CGFloat = rect.origin.y
        let width:CGFloat = rect.size.width
        let height:CGFloat = rect.size.height
        let deltaSpaceWidth:CGFloat = modelWidth - width
        let deltaSpaceHeight:CGFloat = modelHeight - height
        
        if deltaSpaceWidth > 0 || deltaSpaceHeight > 0
        {
            let ratio:CGFloat
            
            if deltaSpaceWidth >= deltaSpaceHeight
            {
                ratio = modelWidth / width
            }
            else
            {
                ratio = modelHeight / height
            }
            
            modelWidth = modelWidth / ratio
            modelHeight = modelHeight / ratio
        }
        
        let zoomedWidth:CGFloat = modelWidth * zoom
        let zoomedHeight:CGFloat = modelHeight * zoom
        let deltaWidth:CGFloat = width - zoomedWidth
        let deltaHeight:CGFloat = height - zoomedHeight
        let deltaWidth_2:CGFloat = deltaWidth / 2.0
        let deltaHeight_2:CGFloat = deltaHeight / 2.0
        let positionX:CGFloat = originX + deltaWidth_2
        let positionY:CGFloat = originY + deltaHeight_2
        let rect:CGRect = CGRect(
            x:positionX,
            y:positionY,
            width:zoomedWidth,
            height:zoomedHeight)
        
        context.addRect(rect)
        context.drawPath(using:CGPathDrawingMode.fillStroke)
    }
}
