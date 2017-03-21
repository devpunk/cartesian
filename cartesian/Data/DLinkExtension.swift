import UIKit
import CoreData

extension DLink
{
    private static let kMarkerRadius:CGFloat = 8
    private static let kLineWidth:Int16 = 2
    
    override func notifyDraw()
    {
        NotificationCenter.default.post(
            name:Notification.linkDraw,
            object:self,
            userInfo:nil)
    }
    
    override func draw(
        rect:CGRect,
        context:CGContext,
        zoom:CGFloat,
        selected:Bool)
    {
        guard
            
            let origin:DNode = self.origin,
            let destination:DNode = self.destination
            
        else
        {
            return
        }
        
        let markerRadius:CGFloat = DLink.kMarkerRadius
        let lineWidth:CGFloat = CGFloat(self.lineWidth)
        let red:CGFloat = CGFloat(colorRed)
        let green:CGFloat = CGFloat(colorGreen)
        let blue:CGFloat = CGFloat(colorBlue)
        let alpha:CGFloat = CGFloat(colorAlpha)
        
        let rectWidth:CGFloat = CGFloat(rect.size.width)
        let rectHeight:CGFloat = CGFloat(rect.size.height)
        
        let originX:CGFloat = CGFloat(origin.centerX)
        let originY:CGFloat = CGFloat(origin.centerY)
        let originWidth:CGFloat = CGFloat(origin.width)
        let originHeight:CGFloat = CGFloat(origin.height)
        let originWidth_2:CGFloat = originWidth / 2.0
        let originHeight_2:CGFloat = originHeight / 2.0
        let originMinX:CGFloat = originX - originWidth_2
        let originMinY:CGFloat = originY - originHeight_2
        
        let destinationX:CGFloat = CGFloat(destination.centerX)
        let destinationY:CGFloat = CGFloat(destination.centerY)
        let destinationWidth:CGFloat = CGFloat(destination.width)
        let destinationHeight:CGFloat = CGFloat(destination.height)
        let destinationWidth_2:CGFloat = destinationWidth / 2.0
        let destinationHeight_2:CGFloat = destinationHeight / 2.0
        let destinationMinX:CGFloat = destinationX - destinationWidth_2
        let destinationMinY:CGFloat = destinationY - destinationHeight_2
        
        let initialX:CGFloat
        let initialY:CGFloat
        let endingX:CGFloat
        let endingY:CGFloat
        let originPointX:CGFloat
        let originPointY:CGFloat
        let destinationAX:CGFloat
        let destinationBX:CGFloat
        let destinationCX:CGFloat
        let destinationAY:CGFloat
        let destinationBY:CGFloat
        let destinationCY:CGFloat
        
        if originMinX <= destinationMinX
        {
            initialX = originWidth
            endingX = rectWidth - destinationWidth
            
            if originMinY <= destinationMinY
            {
                initialY = originHeight_2
                endingY = rectHeight - destinationHeight_2
            }
            else
            {
                initialY = rectHeight - originHeight_2
                endingY = destinationHeight_2
            }
            
            originPointX = initialX
            originPointY = initialY
            
            destinationAX = endingX + markerRadius
            destinationAY = endingY
            destinationBX = endingX - markerRadius
            destinationBY = endingY + markerRadius
            destinationCX = endingX - markerRadius
            destinationCY = endingY - markerRadius
        }
        else
        {
            initialX = destinationWidth
            endingX = rectWidth - originWidth
            
            if originMinY <= destinationMinY
            {
                initialY = rectHeight - destinationHeight_2
                endingY = originHeight_2
            }
            else
            {
                initialY = destinationHeight_2
                endingY = rectHeight - originHeight_2
            }
            
            originPointX = endingX
            originPointY = endingY
            
            destinationAX = initialX + markerRadius
            destinationAY = initialY
            destinationBX = initialX - markerRadius
            destinationBY = initialY + markerRadius
            destinationCX = initialX - markerRadius
            destinationCY = initialY - markerRadius
        }
        
        let initialRectX:CGFloat = originPointX - markerRadius
        let initialRectY:CGFloat = originPointY - markerRadius
        let initialRectSize:CGFloat = markerRadius + markerRadius
        let initialRect:CGRect = CGRect(
            x:initialRectX,
            y:initialRectY,
            width:initialRectSize,
            height:initialRectSize)
        
        let initialPoint:CGPoint = CGPoint(
            x:initialX,
            y:initialY)
        let endingPoint:CGPoint = CGPoint(
            x:endingX,
            y:endingY)
        
        let trianglePointA:CGPoint = CGPoint(
            x:destinationAX,
            y:destinationAY)
        let trianglePointB:CGPoint = CGPoint(
            x:destinationBX,
            y:destinationBY)
        let trianglePointC:CGPoint = CGPoint(
            x:destinationCX,
            y:destinationCY)
        
        context.setLineWidth(lineWidth)
        context.setStrokeColor(
            red:red,
            green:green,
            blue:blue,
            alpha:alpha)
        context.setFillColor(
            red:red,
            green:green,
            blue:blue,
            alpha:alpha)
        context.move(to:initialPoint)
        context.addLine(to:endingPoint)
        context.drawPath(using:CGPathDrawingMode.stroke)
        
        context.addEllipse(in:initialRect)
        context.drawPath(using:CGPathDrawingMode.fill)
        
        context.move(to:trianglePointA)
        context.addLine(to:trianglePointB)
        context.addLine(to:trianglePointC)
        context.closePath()
        context.drawPath(using:CGPathDrawingMode.fill)
    }
    
    //MARK: public
    
    func defaultValues()
    {
        let defaultColor:UIColor = UIColor.black
        
        colorWithColor(color:defaultColor)
        lineWidth = DLink.kLineWidth
    }
}
