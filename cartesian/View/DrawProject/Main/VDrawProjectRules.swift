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
        let zoomScale:CGFloat = controller.modelZoom.currentZoom()
        
        for positionX:Int in 0 ..< width
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
        
        for positionY:Int in 0 ..< height
        {
            let compositePositionY:Int = positionY + offsetY
            let lineWidth:Int?
            
            if compositePositionY % 100 == 0
            {
                lineWidth = kLineHeightFifties
                
                let stringPosition:String = "\(compositePositionY)"
                let attributedString:NSAttributedString = NSAttributedString(
                    string:stringPosition,
                    attributes:attributes)
                let stringRect:CGRect = CGRect(
                    x:kStringTop,
                    y:positionY,
                    width:kStringWidth,
                    height:kStringHeight)
                
                attributedString.draw(in:stringRect)
            }
            else if compositePositionY % 50 == 0
            {
                lineWidth = kLineHeightFifties
            }
            else if compositePositionY % 10 == 0
            {
                lineWidth = kLineHeightTens
            }
            else if compositePositionY % 5 == 0
            {
                lineWidth = kLineHeightFives
            }
            else
            {
                lineWidth = nil
            }
            
            guard
                
                let drawLine:Int = lineWidth
                
            else
            {
                continue
            }
            
            let rect:CGRect = CGRect(
                x:0,
                y:positionY,
                width:drawLine,
                height:kLineWidth)
            context.addRect(rect)
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
