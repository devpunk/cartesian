import UIKit

class VDrawProjectCanvasNodeSpatial:VDrawProjectCanvasViewSpatial
{
    private(set) weak var model:DNode?
    
    init(
        viewCanvas:VDrawProjectCanvasView,
        model:DNode)
    {
        super.init(viewCanvas:viewCanvas)
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
