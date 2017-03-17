import UIKit

class VDrawProjectCanvasView:UIView
{
    private(set) weak var controller:CDrawProject!
    let margin2:CGFloat
    let kMargin:CGFloat = 20
    var selected:Bool
    
    init(controller:CDrawProject)
    {
        margin2 = kMargin + kMargin
        selected = false
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        self.controller = controller
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: public
    
    func positionCenter()
    {
    }
    
    func startMoving()
    {
        selected = true
        setNeedsDisplay()
    }
    
    func stopMoving()
    {
        selected = false
        setNeedsDisplay()
    }
}
