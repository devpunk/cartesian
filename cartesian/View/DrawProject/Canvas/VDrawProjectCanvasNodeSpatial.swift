import UIKit

class VDrawProjectCanvasNodeSpatial:UIView
{
    private(set) weak var model:DNode?
    private weak var viewCanvas:VDrawProjectCanvasView!
    
    init(
        viewCanvas:VDrawProjectCanvasView,
        model:DNode)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        self.viewCanvas = viewCanvas
        self.model = model
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
        
        let zoom:CGFloat = viewCanvas.controller.modelZoom.currentZoom()
        
        model.draw(
            rect:rect,
            context:context,
            zoom:zoom,
            selected:viewCanvas.selected)
    }
}
