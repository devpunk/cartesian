import UIKit
import CoreData

extension DNode
{   
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
    
    func draw(context:CGContext)
    {
        let red:CGFloat = CGFloat(colorRed)
        let green:CGFloat = CGFloat(colorGreen)
        let blue:CGFloat = CGFloat(colorBlue)
        let alpha:CGFloat = CGFloat(colorAlpha)
        
        context.setFillColor(
            red:red,
            green:green,
            blue:blue,
            alpha:alpha)
        context.addRect(CGRect(x:5, y:5, width:20, height:20))
        context.drawPath(using:CGPathDrawingMode.fill)
    }
}