import UIKit

class VDrawProjectRotateCircle:UIView
{
    private let kDeg4_5:CGFloat = 0.0785398
    private let kDeg1:CGFloat = 0.0174533
    private let kMargin:CGFloat = 20
    private let kLineWidth:CGFloat = 10
    
    init()
    {
        super.init(frame:CGRect.zero)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func draw(_ rect:CGRect)
    {
        let width:CGFloat = rect.maxX
        let height:CGFloat = rect.maxY
        let width_2:CGFloat = width / 2.0
        let height_2:CGFloat = height / 2.0
        let center:CGPoint = CGPoint(x:width_2, y:height_2)
        let minSide:CGFloat = min(width, height)
        let minSide_2:CGFloat = minSide / 2.0
        let radius:CGFloat = minSide_2 - kMargin
        
        guard
        
            let context:CGContext = UIGraphicsGetCurrentContext()
        
        else
        {
            return
        }
        
        context.setLineWidth(kLineWidth)
        context.setStrokeColor(UIColor.cartesianBlue.cgColor)
        context.addArc(
            center:center,
            radius:radius,
            startAngle:0.0001,
            endAngle:0,
            clockwise:true)
        context.drawPath(using:CGPathDrawingMode.stroke)
    }
}
