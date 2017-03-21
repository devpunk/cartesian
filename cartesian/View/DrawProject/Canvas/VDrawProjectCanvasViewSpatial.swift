import UIKit

class VDrawProjectCanvasViewSpatial:UIView
{
    private weak var viewCanvas:VDrawProjectCanvasView!
    private(set) weak var model:DDrawable?
    
    init(
        model:DDrawable,
        viewCanvas:VDrawProjectCanvasView)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        self.model = model
        self.viewCanvas = viewCanvas
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func draw(_ rect:CGRect)
    {
        guard
        
            let model:DDrawable = self.model,
            let context:CGContext = UIGraphicsGetCurrentContext()
        
        else
        {
            return
        }
        
        let zoom:CGFloat = viewCanvas.controller.modelZoom.currentZoom()
        let selected:Bool = viewCanvas.selected
        
        model.draw(
            rect:rect,
            context:context,
            zoom:zoom,
            selected:selected)
    }
}
