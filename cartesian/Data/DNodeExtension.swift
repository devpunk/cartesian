import UIKit
import CoreData

extension DNode
{
    override func notifyDraw()
    {
        NotificationCenter.default.post(
            name:Notification.nodeDraw,
            object:self,
            userInfo:nil)
    }
    
    //MARK: final
    
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
    
    final func centerAt(center:CGPoint)
    {
        centerX = Float(center.x)
        centerY = Float(center.y)
    }
    
    //MARK: public
    
    func drawPaths(
        rect:CGRect,
        context:CGContext,
        zoom:CGFloat)
    {
    }
}
