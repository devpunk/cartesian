import UIKit

class VDrawProjectScroll:UIScrollView
{
    private weak var controller:CDrawProject!
    private(set) weak var viewCanvas:VDrawProjectCanvas!
    private var layoutStarted:Bool
    
    init(controller:CDrawProject)
    {
        layoutStarted = false
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let viewCanvas:VDrawProjectCanvas = VDrawProjectCanvas(
            controller:controller)
        self.viewCanvas = viewCanvas
        
        addSubview(viewCanvas)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        if !layoutStarted
        {
            layoutStarted = true
            contentSize = bounds.size
            canvasResize()
        }
        
        super.layoutSubviews()
    }
    
    //MARK: private
    
    private func canvasResize()
    {
        viewCanvas.frame = CGRect(
            origin:CGPoint.zero,
            size:contentSize)
    }
    
    //MARK: public
    
    func centerPoint() -> CGPoint
    {
        let centerX:CGFloat = bounds.midX + contentOffset.x
        let centerY:CGFloat = bounds.midY + contentOffset.y
        let center:CGPoint = CGPoint(
            x:centerX,
            y:centerY)
        
        return center
    }
}
