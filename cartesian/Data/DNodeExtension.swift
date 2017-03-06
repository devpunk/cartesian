import UIKit
import CoreData

extension DNode
{   
    func centerAt(center:CGPoint)
    {
        centerX = Float(center.x)
        centerY = Float(center.y)
    }
    
    func draw(context:CGContext)
    {
        context.setFillColor(UIColor.red.cgColor)
        context.addRect(CGRect(x:5, y:5, width:20, height:20))
        context.drawPath(using:CGPathDrawingMode.fill)
    }
}
