import UIKit
import CoreData

extension DNodePentagon
{
    private static let kSides:Int = 5
    
    override func drawPaths(
        rect:CGRect,
        context:CGContext,
        zoom:CGFloat)
    {
        let sides:Int = DNodePentagon.kSides
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
        let minSize:CGFloat = min(zoomedWidth, zoomedHeight)
        let radius:CGFloat = minSize / 2.0
        let rotationFactor:CGFloat = DNode.kPi2 / CGFloat(sides)
        let startingAngle:CGFloat = -CGFloat(M_PI)
        
        for index:Int in 0 ..< sides
        {
            let thisIndex:CGFloat = CGFloat(index) + 1
            let thisAngle:CGFloat = (thisIndex * rotationFactor) + startingAngle
            let cosineRotation:CGFloat = cos(thisAngle) * radius
            let sineRotation:CGFloat = sin(thisAngle) * radius
            let positionX:CGFloat = radius + cosineRotation
            let positionY:CGFloat = radius + sineRotation
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
            
            print("\(positionPoint)")
        }
        
        context.closePath()
        context.drawPath(using:CGPathDrawingMode.fillStroke)
    }
}
