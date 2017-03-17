import UIKit

class VDrawProjectCanvasView:UIView
{
    private(set) weak var controller:CDrawProject!
    let margin2:CGFloat
    let kMargin:CGFloat = 20
    
    init(controller:CDrawProject)
    {
        margin2 = kMargin + kMargin
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
