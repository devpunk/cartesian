import UIKit

class VDrawProjectMenuEditSpatial:UIView
{
    weak var model:DNode?
    private weak var controller:CDrawProject!
    private let margin2:CGFloat
    private let kBorderWidth:CGFloat = 1
    private let kSelected:Bool = false
    private let kMargin:CGFloat = 10
    
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
    }
    
    required init?(coder:NSCoder)
    {
        return nil
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
            selected:kSelected)
    }
    
    //MARK: actions
    
    func actionButton(sender button:UIButton)
    {
        controller.centerOnEditing()
    }
}
