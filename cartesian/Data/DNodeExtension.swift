import UIKit
import CoreData

extension DNode
{
    //MARK: public
    
    func centerAt(center:CGPoint)
    {
        centerX = Float(center.x)
        centerY = Float(center.y)
    }
    
    func colorWithColor(color:UIColor)
    {
        var red:CGFloat = 0
        var green:CGFloat = 0
        var blue:CGFloat = 0
        var alpha:CGFloat = 0
        
        color.getRed(
            &red,
            green:&green,
            blue:&blue,
            alpha:&alpha)
        
        colorRed = Float(red)
        colorGreen = Float(green)
        colorBlue = Float(blue)
        colorAlpha = Float(alpha)
    }
    
    final func radians() -> CGFloat
    {
        let degrees:CGFloat = CGFloat(rotation)
        let rads:CGFloat = degrees * CGFloat(M_PI) / 180.0
        
        return rads
    }
    
    final func draw(
        rect:CGRect,
        context:CGContext,
        zoom:CGFloat,
        selected:Bool)
    {
        let red:CGFloat = CGFloat(colorRed)
        let green:CGFloat = CGFloat(colorGreen)
        let blue:CGFloat = CGFloat(colorBlue)
        let alpha:CGFloat = CGFloat(colorAlpha)
        let rads:CGFloat = radians()
        let midX:CGFloat = rect.midX
        let midY:CGFloat = rect.midY
        
        if selected
        {
            context.setLineWidth(5)
            context.setStrokeColor(UIColor(white:0, alpha:0.2).cgColor)
        }
        else
        {
            context.setLineWidth(0)
        }
        
        context.setFillColor(
            red:red,
            green:green,
            blue:blue,
            alpha:alpha)
        
        context.translateBy(x:midX, y:midY)
        context.rotate(by:rads)
        context.translateBy(x:-midX, y:-midY)
        
        drawPaths(
            rect:rect,
            context:context,
            zoom:zoom)
    }
    
    final func notifyDraw()
    {
        NotificationCenter.default.post(
            name:Notification.nodeDraw,
            object:self,
            userInfo:nil)
    }
    
    func drawPaths(
        rect:CGRect,
        context:CGContext,
        zoom:CGFloat)
    {
    }
}
