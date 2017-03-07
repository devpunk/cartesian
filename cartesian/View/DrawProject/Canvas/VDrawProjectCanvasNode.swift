import UIKit

class VDrawProjectCanvasNode:UIView
{
    private(set) weak var model:DNode?
    private weak var timer:Timer?
    private weak var viewEffect:VDrawProjectCanvasNodeEffect!
    private var selected:Bool
    private let margin2:CGFloat
    private let kMargin:CGFloat = 20
    private let kTimerInterval:TimeInterval = 0.05
    
    init(model:DNode)
    {
        self.model = model
        margin2 = kMargin + kMargin
        selected = false
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let viewEffect:VDrawProjectCanvasNodeEffect = VDrawProjectCanvasNodeEffect()
        self.viewEffect = viewEffect
        
        addSubview(viewEffect)
        
        NSLayoutConstraint.equals(
            view:viewEffect,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    deinit
    {
        timer?.invalidate()
    }
    
    override func draw(_ rect:CGRect)
    {
        guard
            
            let model:DNode = self.model,
            let context:CGContext = UIGraphicsGetCurrentContext()
            
        else
        {
            return
        }
        
        model.draw(
            rect:rect,
            context:context,
            selected:selected)
    }
    
    //MARK: actions
    
    func actionTick(sender timer:Timer)
    {
        viewEffect.tick()
    }
    
    //MARK: public
    
    func centerNode()
    {
        guard
            
            let model:DNode = self.model
        
        else
        {
            return
        }
        
        let originalX:CGFloat = CGFloat(model.centerX)
        let originalY:CGFloat = CGFloat(model.centerY)
        let widthOriginal:CGFloat = CGFloat(model.width)
        let heightOriginal:CGFloat = CGFloat(model.height)
        let widthOriginal_2:CGFloat = widthOriginal / 2.0
        let heightOriginal_2:CGFloat = heightOriginal / 2.0
        let positionedOriginalX:CGFloat = originalX - widthOriginal_2
        let positionedOriginalY:CGFloat = originalY - heightOriginal_2
        let positionedX:CGFloat = positionedOriginalX - kMargin
        let positionedY:CGFloat = positionedOriginalY - kMargin
        let widthExpanded:CGFloat = widthOriginal + margin2
        let heightExpanded:CGFloat = heightOriginal + margin2
        
        frame = CGRect(
            x:positionedX,
            y:positionedY,
            width:widthExpanded,
            height:heightExpanded)
    }
    
    func startEffect()
    {
        selected = true
        viewEffect.start()
        
        timer = Timer.scheduledTimer(
            timeInterval:kTimerInterval,
            target:self,
            selector:#selector(actionTick(sender:)),
            userInfo:nil,
            repeats:true)
        setNeedsDisplay()
    }
    
    func endEffect()
    {
        selected = false
        viewEffect.end()
        timer?.invalidate()
        setNeedsDisplay()
    }
}
