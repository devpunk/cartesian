import UIKit

class VDrawProjectCanvasLinkSpatial:VDrawProjectCanvasViewSpatial
{
    private(set) weak var model:DLink?
    
    init(
        viewCanvas:VDrawProjectCanvasView,
        model:DLabel)
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
            
            let model:DLabel = self.model,
            let context:CGContext = UIGraphicsGetCurrentContext()
            
            else
        {
            return
        }
        
        model.draw(
            rect:rect,
            context:context,
            selected:viewCanvas.selected)
    }
}
