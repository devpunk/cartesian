import UIKit
import CoreData

extension DLink
{
    private static let kLineWidth:Int16 = 3
    
    //MARK: public
    
    func defaultValues()
    {
        let defaultColor:UIColor = UIColor.black
        
        colorWithColor(color:defaultColor)
        lineWidth = DLink.kLineWidth
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
}
