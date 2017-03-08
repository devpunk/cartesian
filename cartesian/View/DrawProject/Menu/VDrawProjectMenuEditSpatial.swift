import UIKit

class VDrawProjectMenuEditSpatial:UIView
{
    weak var model:DNode?
    private let margin2:CGFloat
    private let kBorderWidth:CGFloat = 1
    private let kSelected:Bool = false
    private let kMargin:CGFloat = 15
    
    init()
    {
        margin2 = kMargin + kMargin
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        
        let border:VBorder = VBorder(color:UIColor(white:0, alpha:0.1))
        addSubview(border)
        
        NSLayoutConstraint.equalsVertical(
            view:border,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:border,
            toView:self)
        NSLayoutConstraint.width(
            view:border,
            constant:kBorderWidth)
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
}
