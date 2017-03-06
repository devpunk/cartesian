import UIKit

class MDrawProjectColorItemUser:MDrawProjectColorItem
{
    init(model:DColor)
    {
        let red:CGFloat = CGFloat(model.red)
        let green:CGFloat = CGFloat(model.green)
        let blue:CGFloat = CGFloat(model.blue)
        let alpha:CGFloat = CGFloat(model.alpha)
        
        let color:UIColor = UIColor(
            red:red,
            green:green,
            blue:blue,
            alpha:alpha)
        
        super.init(color:color)
    }
}
