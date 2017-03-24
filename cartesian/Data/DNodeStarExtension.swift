import UIKit
import CoreData

extension DNodeStar
{
    //MARK: public
    
    final func drawStar(
        rect:CGRect,
        context:CGContext,
        initialAngle:CGFloat,
        zoom:CGFloat,
        sides:Int)
    {
        var modelWidth:CGFloat = CGFloat(self.width)
        var modelHeight:CGFloat = CGFloat(self.height)
        let sides2:Int = sides + sides
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
        let mediumWidth:CGFloat = radiusWidth / 2.0
        let mediumHeight:CGFloat =  radiusHeight / 2.0
        let rotationFactor:CGFloat = DNode.kPi2 / CGFloat(sides)
        let rotationMedium:CGFloat = DNode.kPi2 / CGFloat(sides2)
        
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
            
            let mediumIndex:CGFloat = CGFloat(thisIndex * 2) - 1
            let mediumAngle:CGFloat = (mediumIndex * rotationMedium) + initialAngle
            let cosineMedium:CGFloat = cos(mediumAngle) * mediumWidth
            let sineMedium:CGFloat = sin(mediumAngle) * mediumHeight
            let mediumX:CGFloat = centerX + cosineMedium
            let mediumY:CGFloat = centerY + sineMedium
            let mediumPoint:CGPoint = CGPoint(
                x:mediumX,
                y:mediumY)
            
            if index == 0
            {
                context.move(to:mediumPoint)
            }
            else
            {
                context.addLine(to:mediumPoint)
            }
            
            context.addLine(to:positionPoint)
        }
        
        context.closePath()
        context.drawPath(using:CGPathDrawingMode.fillStroke)
    }
}
