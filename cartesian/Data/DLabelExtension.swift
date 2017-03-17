import UIKit
import CoreData

extension DLabel
{
    private static let kMaxWidth:CGFloat = 300
    private static let kMaxHeight:CGFloat = 1200
    
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
    
    func generate(text:String)
    {
        self.text = text
        
        guard
        
            let attribuedString:NSAttributedString = displayableString()
        
        else
        {
            return
        }
        
        let maxSize:CGSize = CGSize(
            width:DLabel.kMaxWidth,
            height:DLabel.kMaxHeight)
        let drawingOptions:NSStringDrawingOptions = NSStringDrawingOptions([
            NSStringDrawingOptions.usesLineFragmentOrigin,
            NSStringDrawingOptions.usesFontLeading])
        let stringRect:CGRect = attribuedString.boundingRect(
            with:maxSize,
            options:drawingOptions,
            context:nil)
        
        width = Float(stringRect.size.width)
        height = Float(stringRect.size.height)
    }
    
    func displayableString() -> NSAttributedString?
    {
        let fontSize:CGFloat = CGFloat(self.fontSize)
        
        guard
        
            let text:String = self.text,
            let fontName:String = self.fontName,
            let font:UIFont = UIFont(name:fontName, size:fontSize)
        
        else
        {
            return nil
        }
        
        let attributes:[String:AnyObject] = [
            NSFontAttributeName:font]
        
        let attributedString:NSAttributedString = NSAttributedString(
            string:text,
            attributes:attributes)
        
        return attributedString
    }
    
    func draw(
        rect:CGRect,
        context:CGContext,
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
}
