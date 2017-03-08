import UIKit

class VDrawProjectCanvasNodeSpatial:UIView
{
    private(set) weak var model:DNode?
    private weak var controller:CDrawProject!
    var selected:Bool
    
    init(
        controller:CDrawProject,
        model:DNode)
    {
        self.model = model
        selected = false
        self.controller = controller
        
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
        
        let zoom:CGFloat = controller.modelZoom.currentZoom()
        
        model.draw(
            rect:rect,
            context:context,
            zoom:zoom,
            selected:selected)
    }
}
