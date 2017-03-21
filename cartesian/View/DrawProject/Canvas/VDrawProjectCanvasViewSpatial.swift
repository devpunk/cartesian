import UIKit

class VDrawProjectCanvasViewSpatial:UIView
{
    weak var viewCanvas:VDrawProjectCanvasView!
    
    init()
    {
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
}
