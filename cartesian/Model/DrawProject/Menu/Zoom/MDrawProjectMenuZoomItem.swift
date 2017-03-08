import UIKit

class MDrawProjectMenuZoomItem
{
    let scalar:CGFloat
    let kLineLong:Int = 20
    let kLineMedium:Int = 10
    let kLineSmall:Int = 7
    private let attributes:[String:AnyObject]
    private let kLineWidth:Int = 1
    private let kTextTop:Int = 22
    private let kTextWidth:Int = 150
    private let kTextHeight:Int = 14
    
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
        let rect:CGRect = CGRect(
            x:position,
            y:0,
            width:kLineWidth,
            height:length)
        
        context.addRect(rect)
    }
    
    final func drawLineVertical(
        context:CGContext,
        position:Int,
        length:Int)
    {
        let rect:CGRect = CGRect(
            x:0,
            y:position,
            width:length,
            height:kLineWidth)
        
        context.addRect(rect)
    }
    
    final func drawGuideHorizontal(position:Int)
    {
        let stringPosition:String = "\(position)"
        let attributedString:NSAttributedString = NSAttributedString(
            string:stringPosition,
            attributes:attributes)
        
        let stringRect:CGRect = CGRect(
            x:position,
            y:kTextTop,
            width:kTextWidth,
            height:kTextHeight)
        
        attributedString.draw(in:stringRect)
    }
    
    final func drawGuideVertical(position:Int)
    {
        let stringPosition:String = "\(position)"
        let attributedString:NSAttributedString = NSAttributedString(
            string:stringPosition,
            attributes:attributes)
        
        let stringRect:CGRect = CGRect(
            x:kTextTop,
            y:position,
            width:kTextWidth,
            height:kTextHeight)
        
        attributedString.draw(in:stringRect)
    }
}
