import UIKit

class VDrawProjectRules:UIView
{
    private weak var controller:CDrawProject!
    private let kLineWidth:CGFloat = 1
    private let kLineHeight:CGFloat = 10
    private let kDelta:CGFloat = 10
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func draw(_ rect:CGRect)
    {
        print("draw rules")
        
        guard
            
            let context:CGContext = UIGraphicsGetCurrentContext()
            
            else
        {
            return
        }
        
        context.setStrokeColor(UIColor.black.cgColor)
        let width:CGFloat = rect.maxX
        let height:CGFloat = rect.maxY
        var currentX:CGFloat = kDelta
        
        while currentX < width
        {
            let rect:CGRect = CGRect(
                x:currentX,
                y:0,
                width:kLineWidth,
                height:kLineHeight)
            
            context.addRect(rect)
            currentX += kDelta
        }
        
        context.drawPath(using:CGPathDrawingMode.fill)
    }
}
