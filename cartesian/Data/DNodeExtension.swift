import UIKit
import CoreData

extension DNode
{
    static let kPi2:CGFloat = CGFloat(M_PI) * 2.0
    private static let kInitialSize:Float = 100
    
    override func notifyDraw()
    {
        NotificationCenter.default.post(
            name:Notification.nodeDraw,
            object:self,
            userInfo:nil)
    }
    
    override func draw(
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
    
    //MARK: public
    
    final func radians() -> CGFloat
    {
        let degrees:CGFloat = CGFloat(rotation)
        let rads:CGFloat = degrees * CGFloat(M_PI) / 180.0
        
        return rads
    }
    
    final func centerAt(center:CGPoint)
    {
        centerX = Float(center.x)
        centerY = Float(center.y)
    }
    
    final func notifyLinks()
    {
        guard
        
            let linksOrigin:[DLink] = self.linksOrigin?.array as? [DLink],
            let linksDestination:[DLink] = self.linksDestination?.array as? [DLink]
        
        else
        {
            return
        }
        
        for linkOrigin:DLink in linksOrigin
        {
            linkOrigin.notifyDraw()
        }
        
        for linkDestination in linksDestination
        {
            linkDestination.notifyDraw()
        }
    }
    
    final func defaultValues()
    {
        width = DNode.kInitialSize
        height = DNode.kInitialSize
    }
    
    func drawPaths(
        rect:CGRect,
        context:CGContext,
        zoom:CGFloat)
    {
    }
}
