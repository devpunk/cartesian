import UIKit

class MDrawProjectMenuZoomItem
{
    let scalar:CGFloat
    let attributes:[String:AnyObject]
    
    init(scalar:CGFloat)
    {
        self.scalar = scalar
        attributes = [
            NSFontAttributeName:UIFont.numeric(size:10),
            NSForegroundColorAttributeName:UIColor.black]
    }
    
    //MARK: public
    
    func draw(
        context:CGContext,
        position:Int,
        ruleType:MDrawProjectMenuZoom.RuleType)
    {
        
    }
}
