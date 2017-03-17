import UIKit

class VDrawProjectCanvasNode:VDrawProjectCanvasView
{
    private(set) weak var viewSpatial:VDrawProjectCanvasNodeSpatial!
    private weak var timer:Timer?
    private weak var viewEffect:VDrawProjectCanvasNodeEffect!
    private let kTimerInterval:TimeInterval = 0.05
    
    init(
        controller:CDrawProject,
        model:DNode)
    {
        super.init(controller:controller)
        
        let viewSpatial:VDrawProjectCanvasNodeSpatial = VDrawProjectCanvasNodeSpatial(
            viewCanvas:self,
            model:model)
        self.viewSpatial = viewSpatial
        
        let viewEffect:VDrawProjectCanvasNodeEffect = VDrawProjectCanvasNodeEffect(
            viewCanvas:self,
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
    
    override func positionCenter()
    {
        guard
            
            let model:DNode = viewSpatial.model
            
        else
        {
            return
        }
        
        let zoom:CGFloat = controller.modelZoom.currentZoom()
        let originalX:CGFloat = CGFloat(model.centerX)
        let originalY:CGFloat = CGFloat(model.centerY)
        let widthOriginal:CGFloat = CGFloat(model.width)
        let heightOriginal:CGFloat = CGFloat(model.height)
        let widthOriginal_2:CGFloat = widthOriginal / 2.0
        let heightOriginal_2:CGFloat = heightOriginal / 2.0
        let positionedOriginalX:CGFloat = originalX - widthOriginal_2
        let positionedOriginalY:CGFloat = originalY - heightOriginal_2
        let zoomedX:CGFloat = positionedOriginalX * zoom
        let zoomedY:CGFloat = positionedOriginalY * zoom
        let zoomedWidth:CGFloat = widthOriginal * zoom
        let zoomedHeight:CGFloat = heightOriginal * zoom
        let positionedX:CGFloat = zoomedX - kMargin
        let positionedY:CGFloat = zoomedY - kMargin
        let widthExpanded:CGFloat = zoomedWidth + margin2
        let heightExpanded:CGFloat = zoomedHeight + margin2
        
        frame = CGRect(
            x:positionedX,
            y:positionedY,
            width:widthExpanded,
            height:heightExpanded)
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
            positionCenter()
            layoutIfNeeded()
            
            if timer == nil
            {
                setNeedsDisplay()
            }
            else
            {
                startEffect()
            }
        }
    }
    
    //MARK: actions
    
    func actionTick(sender timer:Timer)
    {
        viewEffect.tick()
    }
    
    //MARK: public
    
    func startEffect()
    {
        viewEffect.start()
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(
            timeInterval:kTimerInterval,
            target:self,
            selector:#selector(actionTick(sender:)),
            userInfo:nil,
            repeats:true)
        
        startEditing()
    }
    
    func endEffect()
    {
        viewEffect.end()
        timer?.invalidate()
        stopEditing()
    }
}
