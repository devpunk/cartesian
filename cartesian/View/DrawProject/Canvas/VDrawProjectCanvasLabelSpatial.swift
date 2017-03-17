import UIKit

class VDrawProjectCanvasLabelSpatial:UIView
{
    private(set) weak var model:DLabel?
    private weak var controller:CDrawProject!
    
    init(
        controller:CDrawProject,
        model:DLabel)
    {
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
}
