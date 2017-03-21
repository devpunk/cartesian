import UIKit
import CoreData

extension DLink
{
    private static let kLineWidth:Int16 = 3
    
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
        
        if originMinX <= destinationMinX
        {
            initialX = originWidth
            endingX = rectWidth - destinationWidth
        }
        else
        {
            initialX = destinationWidth
            endingX = rectWidth - originWidth
        }
        
        if originMinY <= destinationMinY
        {
            initialY = originHeight_2
            endingY = rectHeight - destinationHeight_2
        }
        else
        {
            initialY = destinationHeight_2
            endingY = rectHeight - originHeight_2
        }
        
        let initialPoint:CGPoint = CGPoint(
            x:initialX,
            y:initialY)
        let endingPoint:CGPoint = CGPoint(
            x:endingX,
            y:endingY)
        
        context.setLineWidth(lineWidth)
        context.setStrokeColor(
            red:red,
            green:green,
            blue:blue,
            alpha:alpha)
        context.move(to:initialPoint)
        context.addLine(to:endingPoint)
        context.drawPath(using:CGPathDrawingMode.stroke)
    }
    
    //MARK: public
    
    func defaultValues()
    {
        let defaultColor:UIColor = UIColor.black
        
        colorWithColor(color:defaultColor)
        lineWidth = DLink.kLineWidth
    }
}
