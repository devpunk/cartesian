import UIKit
import CoreData

extension DLink
{
    private static let kMargin:CGFloat = 20
    private static let kLineSelected:CGFloat = 6
    private static let kMarkerRadius:Int16 = 8
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
        
        let viewMargin:CGFloat = DLink.kMargin
        let markerRadius:CGFloat = CGFloat(self.markerRadius)
        let markerRadius2:CGFloat = markerRadius + markerRadius
        let markerRadius_2:CGFloat = markerRadius / 2.0
        let lineWidth:CGFloat = CGFloat(self.lineWidth)
        let red:CGFloat = CGFloat(colorRed)
        let green:CGFloat = CGFloat(colorGreen)
        let blue:CGFloat = CGFloat(colorBlue)
        let alpha:CGFloat = CGFloat(colorAlpha)
        
        let rectWidth:CGFloat = CGFloat(rect.size.width) - viewMargin
        let rectHeight:CGFloat = CGFloat(rect.size.height) - viewMargin
        
        let originX:CGFloat = CGFloat(origin.centerX) * zoom
        let originY:CGFloat = CGFloat(origin.centerY) * zoom
        let originWidth:CGFloat = CGFloat(origin.width) * zoom
        let originHeight:CGFloat = CGFloat(origin.height) * zoom
        let originWidth_2:CGFloat = originWidth / 2.0
        let originHeight_2:CGFloat = originHeight / 2.0
        let originMinX:CGFloat = originX - originWidth_2
        let originMinY:CGFloat = originY - originHeight_2
        
        let destinationX:CGFloat = CGFloat(destination.centerX) * zoom
        let destinationY:CGFloat = CGFloat(destination.centerY) * zoom
        let destinationWidth:CGFloat = CGFloat(destination.width) * zoom
        let destinationHeight:CGFloat = CGFloat(destination.height) * zoom
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
        let triangleCircleX:CGFloat
        let triangleCircleY:CGFloat
        
        if originMinX <= destinationMinX
        {
            initialX = originWidth + viewMargin
            endingX = rectWidth - destinationWidth - markerRadius2
            
            if originMinY <= destinationMinY
            {
                initialY = originHeight_2 + viewMargin
                endingY = rectHeight - destinationHeight_2
            }
            else
            {
                initialY = rectHeight - originHeight_2
                endingY = destinationHeight_2 + viewMargin
            }
            
            originPointX = initialX
            originPointY = initialY
            
            destinationAX = endingX + markerRadius2
            destinationAY = endingY
            destinationBX = endingX
            destinationBY = endingY + markerRadius
            destinationCX = endingX
            destinationCY = endingY - markerRadius
            
            triangleCircleX = endingX - markerRadius_2
            triangleCircleY = endingY - markerRadius_2
        }
        else
        {
            initialX = destinationWidth + markerRadius2 + viewMargin
            endingX = rectWidth - originWidth
            
            if originMinY <= destinationMinY
            {
                initialY = rectHeight - destinationHeight_2
                endingY = originHeight_2 + viewMargin
            }
            else
            {
                initialY = destinationHeight_2 + viewMargin
                endingY = rectHeight - originHeight_2
            }
            
            originPointX = endingX
            originPointY = endingY
            
            destinationAX = initialX - markerRadius2
            destinationAY = initialY
            destinationBX = initialX
            destinationBY = initialY + markerRadius
            destinationCX = initialX
            destinationCY = initialY - markerRadius
            
            triangleCircleX = initialX - markerRadius_2
            triangleCircleY = initialY - markerRadius_2
        }
        
        let initialRectX:CGFloat = originPointX - markerRadius
        let initialRectY:CGFloat = originPointY - markerRadius
        let initialRect:CGRect = CGRect(
            x:initialRectX,
            y:initialRectY,
            width:markerRadius2,
            height:markerRadius2)
        let triangleCircleRect:CGRect = CGRect(
            x:triangleCircleX,
            y:triangleCircleY,
            width:markerRadius,
            height:markerRadius)
        
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
        
        if selected
        {
            context.setLineWidth(DLink.kLineSelected)
        }
        else
        {
            context.setLineWidth(lineWidth)
        }
        
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
        
        context.addEllipse(in:triangleCircleRect)
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
        markerRadius = DLink.kMarkerRadius
    }
}
