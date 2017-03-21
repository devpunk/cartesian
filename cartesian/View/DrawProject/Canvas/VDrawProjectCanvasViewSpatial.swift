import UIKit

class VDrawProjectCanvasViewSpatial:UIView
{
    private(set) weak var viewCanvas:VDrawProjectCanvasView!
    
    init(viewCanvas:VDrawProjectCanvasView)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        self.viewCanvas = viewCanvas
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
