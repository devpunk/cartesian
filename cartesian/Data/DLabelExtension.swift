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
}
