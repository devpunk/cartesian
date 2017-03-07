import UIKit

class VDrawProjectCanvasNodeSpatial:UIView
{
    private(set) weak var model:DNode?
    var selected:Bool
    
    init(model:DNode)
    {
        self.model = model
        selected = false
        
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
}
