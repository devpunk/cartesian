import UIKit

class VDrawProjectMenuEditSpatial:UIView
{
    weak var model:DNode?
    private weak var controller:CDrawProject!
    private let margin2:CGFloat
    private let kBorderWidth:CGFloat = 1
    private let kSelected:Bool = false
    private let kMargin:CGFloat = 10
    private let kZoom:CGFloat = 1
    
    init(controller:CDrawProject)
    {
        margin2 = kMargin + kMargin
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let border:VBorder = VBorder(color:UIColor(white:0, alpha:0.1))
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.clear
        button.addTarget(
            self,
            action:#selector(actionButton(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(border)
        addSubview(button)
        
        NSLayoutConstraint.equalsVertical(
            view:border,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:border,
            toView:self)
        NSLayoutConstraint.width(
            view:border,
            constant:kBorderWidth)
        
        NSLayoutConstraint.equals(
            view:button,
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
        NotificationCenter.default.removeObserver(self)
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
        
        let newRect:CGRect = CGRect(
            x:rect.origin.x + kMargin,
            y:rect.origin.y + kMargin,
            width:rect.size.width - margin2,
            height:rect.size.height - margin2)
        
        model.draw(
            rect:newRect,
            context:context,
            zoom:kZoom,
            selected:kSelected)
    }
    
    //MARK: notifications
    
    func notifiedNodeDraw(sender notification:Notification)
    {
        guard
            
            let nodeSender:DNode = notification.object as? DNode,
            let currentNode:DNode = model
            
        else
        {
            return
        }
        
        if currentNode === nodeSender
        {
            setNeedsDisplay()
        }
    }
    
    //MARK: actions
    
    func actionButton(sender button:UIButton)
    {
        guard
            
            let point:CGPoint = controller.editingNode?.center
        
        else
        {
            return
        }
        
        controller.viewProject.viewScroll.centerOn(
            point:point)
    }
}
