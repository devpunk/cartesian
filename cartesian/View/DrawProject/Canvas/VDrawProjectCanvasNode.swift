import UIKit

class VDrawProjectCanvasNode:UIView
{
    private(set) weak var viewSpatial:VDrawProjectCanvasNodeSpatial!
    private weak var timer:Timer?
    private weak var viewEffect:VDrawProjectCanvasNodeEffect!
    private let margin2:CGFloat
    private let kMargin:CGFloat = 20
    private let kTimerInterval:TimeInterval = 0.05
    
    init(model:DNode)
    {
        margin2 = kMargin + kMargin
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let viewSpatial:VDrawProjectCanvasNodeSpatial = VDrawProjectCanvasNodeSpatial(
            model:model)
        self.viewSpatial = viewSpatial
        
        let viewEffect:VDrawProjectCanvasNodeEffect = VDrawProjectCanvasNodeEffect(
            model:model)
        self.viewEffect = viewEffect
        
        addSubview(viewSpatial)
        addSubview(viewEffect)
        
        NSLayoutConstraint.equals(
            view:viewSpatial,
            toView:self)
        NSLayoutConstraint.equals(
            view:viewEffect,
            toView:self)
        
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(self.notifiedNodeDraw(sender:)),
            name:Notification.nodeDraw,
            object:nil)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    deinit
    {
        timer?.invalidate()
        NotificationCenter.default.removeObserver(self)
    }
    
    override func draw(_ rect:CGRect)
    {
        viewSpatial.setNeedsDisplay()
    }
    
    //MARK: notifications
    
    func notifiedNodeDraw(sender notification:Notification)
    {
        guard
        
            let nodeSender:DNode = notification.object as? DNode,
            let currentNode:DNode = viewSpatial.model
        
        else
        {
            return
        }
        
        if currentNode === nodeSender
        {
            centerNode()
            setNeedsDisplay()
        }
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
            
            let model:DNode = self.viewSpatial.model
        
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
        viewSpatial.selected = true
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
        viewSpatial.selected = false
        viewEffect.end()
        timer?.invalidate()
        setNeedsDisplay()
    }
}
