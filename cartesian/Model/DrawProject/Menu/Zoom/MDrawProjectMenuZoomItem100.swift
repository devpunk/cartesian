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
        ruleType:MDrawProjectMenuZoom.RuleType)
    {
        let sumPositionX:CGFloat = CGFloat(positionX + offsetX)
        let sumPositionXZoom:CGFloat = sumPositionX / zoomScale
        let compositePositionX:Int = Int(round(sumPositionXZoom))
        let lineHeight:Int?
        
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
