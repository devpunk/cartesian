import UIKit
import CoreData

extension DLabel
{
    private static let kMaxWidth:CGFloat = 220
    private static let kMaxHeight:CGFloat = 1200
    private static let kDrawingOptions:NSStringDrawingOptions = NSStringDrawingOptions([
        NSStringDrawingOptions.usesLineFragmentOrigin,
        NSStringDrawingOptions.usesFontLeading])
    
    override func notifyDraw()
    {
        NotificationCenter.default.post(
            name:Notification.labelDraw,
            object:self,
            userInfo:nil)
    }
    
    //MARK: private
    
    private func displayableString() -> NSAttributedString?
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
        
        let red:CGFloat = CGFloat(colorRed)
        let green:CGFloat = CGFloat(colorGreen)
        let blue:CGFloat = CGFloat(colorBlue)
        let alpha:CGFloat = CGFloat(colorAlpha)
        let color:UIColor = UIColor(red:red, green:green, blue:blue, alpha:alpha)
        
        let attributes:[String:AnyObject] = [
            NSFontAttributeName:font,
            NSForegroundColorAttributeName:color]
        
        let attributedString:NSAttributedString = NSAttributedString(
            string:text,
            attributes:attributes)
        
        return attributedString
    }
    
    //MARK: public
    
    func centerAt(center:CGPoint)
    {
        centerX = Float(center.x)
        centerY = Float(center.y)
    }
    
    func updateGenerated()
    {
        guard
            
            let attribuedString:NSAttributedString = displayableString()
            
        else
        {
            return
        }
        
        let maxSize:CGSize = CGSize(
            width:DLabel.kMaxWidth,
            height:DLabel.kMaxHeight)
        let stringRect:CGRect = attribuedString.boundingRect(
            with:maxSize,
            options:DLabel.kDrawingOptions,
            context:nil)
        
        width = Float(ceil(stringRect.size.width))
        height = Float(ceil(stringRect.size.height))
    }
    
    func generate(text:String)
    {
        self.text = text
        updateGenerated()
    }
    
    func draw(
        rect:CGRect,
        context:CGContext,
        selected:Bool)
    {
        guard
            
            let attributedString:NSAttributedString = displayableString()
        
        else
        {
            return
        }

        if selected
        {
            context.setLineWidth(5)
            context.setStrokeColor(UIColor.cartesianBlue.withAlphaComponent(0.4).cgColor)
            context.setFillColor(UIColor(white:1, alpha:0.9).cgColor)
            context.addRect(rect)
            context.drawPath(using:CGPathDrawingMode.fillStroke)
        }
        
        let width:CGFloat = CGFloat(self.width)
        let height:CGFloat = CGFloat(self.height)
        let remainWidth:CGFloat = rect.size.width - width
        let remainHeight:CGFloat = rect.size.height - height
        let left:CGFloat = floor(remainWidth / 2.0)
        let top:CGFloat = floor(remainHeight / 2.0)
        let rectString:CGRect = CGRect(
            x:left,
            y:top,
            width:width,
            height:height)
        
        attributedString.draw(
            with:rectString,
            options:DLabel.kDrawingOptions,
            context:nil)
    }
}
