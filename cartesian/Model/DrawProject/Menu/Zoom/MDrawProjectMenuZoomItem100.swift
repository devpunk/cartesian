import UIKit

class MDrawProjectMenuZoomItem100:MDrawProjectMenuZoomItem
{
    private let kScalar:CGFloat = 1
    
    init()
    {
        super.init(scalar:kScalar)
    }
    
    override func draw(
        context:CGContext,
        position:Int,
        compositePosition:Int,
        ruleType:MDrawProjectMenuZoom.RuleType)
    {
        let zoomPosition:CGFloat = CGFloat(compositePosition) / kScalar
        let lineLength:Int
        
        if zoomPosition.remainder(dividingBy:100) == 0
        {
            lineLength = kLineLong
        }
        else if zoomPosition.remainder(dividingBy:50) == 0
        {
            lineLength = kLineLong
        }
        else if zoomPosition.remainder(dividingBy:10) == 0
        {
            lineLength = kLineMedium
        }
        else if zoomPosition.remainder(dividingBy:5) == 0
        {
            lineLength = kLineSmall
        }
        else
        {
            return
        }
        
        let rect:CGRect = CGRect(
            x:positionX,
            y:0,
            width:kLineWidth,
            height:drawLine)
        context.addRect(rect)
        
        
        if compositePositionX % 100 == 0
        {
            lineHeight = kLineHeightFifties
            
            let stringPosition:String = "\(compositePositionX)"
            let attributedString:NSAttributedString = NSAttributedString(
                string:stringPosition,
                attributes:attributes)
            let stringRect:CGRect = CGRect(
                x:positionX,
                y:kStringTop,
                width:kStringWidth,
                height:kStringHeight)
            
            attributedString.draw(in:stringRect)
        }
        else if compositePositionX % 50 == 0
        {
            lineHeight = kLineHeightFifties
        }
        else if compositePositionX % 10 == 0
        {
            lineHeight = kLineHeightTens
        }
        else if compositePositionX % 5 == 0
        {
            lineHeight = kLineHeightFives
        }
        else
        {
            lineHeight = nil
        }
        
        guard
            
            let drawLine:Int = lineHeight
            
            else
        {
            continue
        }
        
        let rect:CGRect = CGRect(
            x:positionX,
            y:0,
            width:kLineWidth,
            height:drawLine)
        context.addRect(rect)
    }
}
