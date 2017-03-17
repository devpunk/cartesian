import UIKit

class VDrawProjectCanvasLabelSpatial:UIView
{
    private(set) weak var model:DLabel?
    private weak var viewCanvas:VDrawProjectCanvasView!
    
    init(
        viewCanvas:VDrawProjectCanvasView,
        model:DLabel)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        backgroundColor = UIColor.clear
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
