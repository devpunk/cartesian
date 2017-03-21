import UIKit

class VDrawProjectCanvasLabelSpatial:VDrawProjectCanvasViewSpatial
{
    private(set) weak var model:DLabel?
    
    init(model:DLabel)
    {
        super.init()
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
