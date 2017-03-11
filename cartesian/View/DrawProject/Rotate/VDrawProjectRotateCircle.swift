import UIKit

class VDrawProjectRotateCircle:UIView
{
    private let kDeg2_5:CGFloat = 0.03926991
    private let kDeg0_5:CGFloat = 0.00872665
    private let kDeg0_25:CGFloat = 0.004363323503980034469
    private let kMargin:CGFloat = 20
    private let kLineWidth:CGFloat = 6
    private let kPi_2:CGFloat = CGFloat(M_PI_2)
    private let kPi_3_4:CGFloat = CGFloat(M_PI_2 + M_PI)
    
    init()
    {
        super.init(frame:CGRect.zero)
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        backgroundColor = UIColor.clear
        isUserInteractionEnabled = false
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
        
        let deltaAngle:CGFloat = kDeg0_5 + kDeg2_5
        var currentAngle:CGFloat = -(kPi_2 + kDeg0_25)
        
        while currentAngle <= kPi_2
        {
            let endAngle:CGFloat = currentAngle + kDeg0_5
            
            context.addArc(
                center:center,
                radius:radius,
                startAngle:currentAngle,
                endAngle:endAngle,
                clockwise:false)
            context.drawPath(using:CGPathDrawingMode.stroke)
            
            currentAngle += deltaAngle
        }
        
        currentAngle = -kPi_2 + kDeg0_25
        
        while currentAngle >= -kPi_3_4
        {
            let endAngle:CGFloat = currentAngle - kDeg0_5
            
            context.addArc(
                center:center,
                radius:radius,
                startAngle:currentAngle,
                endAngle:endAngle,
                clockwise:true)
            context.drawPath(using:CGPathDrawingMode.stroke)
            
            currentAngle -= deltaAngle
        }
    }
}
