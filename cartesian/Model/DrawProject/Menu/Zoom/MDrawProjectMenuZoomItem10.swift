import UIKit

class MDrawProjectMenuZoomItem10:MDrawProjectMenuZoomItem
{
    private let kScalar:CGFloat = 0.1
    
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
        
        if zoomPosition.remainder(dividingBy:500) == 0
        {
            lineLength = kLineLong
            
            switch ruleType
            {
            case MDrawProjectMenuZoom.RuleType.horizontal:
                
                drawGuideHorizontal(
                    position:position,
                    guide:zoomPosition)
                
                break
                
            case MDrawProjectMenuZoom.RuleType.vertical:
                
                drawGuideVertical(
                    position:position,
                    guide:zoomPosition)
                
                break
            }
        }
        else if zoomPosition.remainder(dividingBy:250) == 0
        {
            lineLength = kLineMedium
        }
        else if zoomPosition.remainder(dividingBy:100) == 0
        {
            lineLength = kLineSmall
        }
        else
        {
            return
        }
        
        switch ruleType
        {
        case MDrawProjectMenuZoom.RuleType.horizontal:
            
            drawLineHorizontal(
                context:context,
                position:position,
                length:lineLength)
            
            break
            
        case MDrawProjectMenuZoom.RuleType.vertical:
            
            drawLineVertical(
                context:context,
                position:position,
                length:lineLength)
            
            break
        }
    }
}
