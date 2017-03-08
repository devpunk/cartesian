import UIKit

class MDrawProjectMenuZoomItem
{
    let scalar:CGFloat
    let attributes:[String:AnyObject]
    let kLineLong:Int = 20
    let kLineMedium:Int = 10
    let kLineSmall:Int = 7
    
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
        compositePosition:Int,
        ruleType:MDrawProjectMenuZoom.RuleType)
    {
    }
    
    final func drawLineHorizontal(
        context:CGContext,
        position:Int,
        length:Int)
    {
        
    }
    
    final func drawLineVertical(
        context:CGContext,
        position:Int,
        length:Int)
    {
        
    }
}
