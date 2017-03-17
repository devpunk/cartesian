import UIKit

class VDrawProjectCanvasLabelSpatial:UIView
{
    private(set) weak var model:DLabel?
    private weak var controller:CDrawProject!
    var selected:Bool
    
    init(
        controller:CDrawProject,
        model:DLabel)
    {
        selected = false
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        backgroundColor = UIColor.clear
        self.controller = controller
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
            selected:selected)
    }
}
