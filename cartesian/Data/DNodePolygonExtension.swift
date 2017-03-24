import UIKit
import CoreData

extension DNodePolygon
{
    //MARK: public
    
    final func drawPolygon(
        rect:CGRect,
        context:CGContext,
        initialAngle:CGFloat,
        zoom:CGFloat,
        sides:Int)
    {
        var modelWidth:CGFloat = CGFloat(self.width)
        var modelHeight:CGFloat = CGFloat(self.height)
        let originX:CGFloat = rect.origin.x
        let originY:CGFloat = rect.origin.y
        let width:CGFloat = rect.size.width
        let height:CGFloat = rect.size.height
        let width_2:CGFloat = width / 2.0
        let height_2:CGFloat = height / 2.0
        let centerX:CGFloat = width_2 + originX
        let centerY:CGFloat = height_2 + originY
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
        let radiusWidth:CGFloat = zoomedWidth / 2.0
        let radiusHeight:CGFloat = zoomedHeight / 2.0
        let rotationFactor:CGFloat = DNode.kPi2 / CGFloat(sides)
        
        for index:Int in 0 ..< sides
        {
            let thisIndex:CGFloat = CGFloat(index) + 1
            let thisAngle:CGFloat = (thisIndex * rotationFactor) + initialAngle
            let cosineRotation:CGFloat = cos(thisAngle) * radiusWidth
            let sineRotation:CGFloat = sin(thisAngle) * radiusHeight
            let positionX:CGFloat = centerX + cosineRotation
            let positionY:CGFloat = centerY + sineRotation
            let positionPoint:CGPoint = CGPoint(
                x:positionX,
                y:positionY)
            
            if index == 0
            {
                context.move(to:positionPoint)
            }
            else
            {
                context.addLine(to:positionPoint)
            }
        }
        
        context.closePath()
        context.drawPath(using:CGPathDrawingMode.fillStroke)
    }
}
