import UIKit

class VDrawProjectRules:UIView
{
    private weak var controller:CDrawProject!
    private var offsetX:Int
    private var offsetY:Int
    private let attributes:[String:AnyObject]
    private let kLineWidth:Int = 1
    private let kLineHeightFifties:Int = 20
    private let kLineHeightTens:Int = 10
    private let kLineHeightFives:Int = 7
    private let kStringTop:Int = 22
    private let kStringWidth:Int = 150
    private let kStringHeight:Int = 14
    
    init(controller:CDrawProject)
    {
        offsetX = 0
        offsetY = 0
        attributes = [
            NSFontAttributeName:UIFont.numeric(size:10),
            NSForegroundColorAttributeName:UIColor.black]
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }

    override func layoutSubviews()
    {
        setNeedsDisplay()
        
        super.layoutSubviews()
    }
    
    override func draw(_ rect:CGRect)
    {
        guard
            
            let context:CGContext = UIGraphicsGetCurrentContext()
            
        else
        {
            return
        }
        
        context.setStrokeColor(UIColor.black.cgColor)
        let width:Int = Int(rect.maxX)
        let height:Int = Int(rect.maxY)
        let zoomModel:MDrawProjectMenuZoomItem = controller.modelZoom.currentZoomModel()
        
        for positionX:Int in 0 ..< width
        {
            let sumPositionX:Int = positionX + offsetX
            zoomModel.draw(
                context:context,
                position:positionX,
                compositePosition:sumPositionX,
                ruleType:MDrawProjectMenuZoom.RuleType.horizontal)
        }
        
        for positionY:Int in 0 ..< height
        {
            let sumPositionY:Int = positionY + offsetY
            zoomModel.draw(
                context:context,
                position:positionY,
                compositePosition:sumPositionY,
                ruleType:MDrawProjectMenuZoom.RuleType.vertical)
        }
        
        context.drawPath(using:CGPathDrawingMode.fill)
    }
    
    //MARK: public
    
    func scrollDidScroll(offset:CGPoint)
    {
        offsetX = Int(round(offset.x))
        offsetY = Int(round(offset.y))
        
        setNeedsDisplay()
    }
}
