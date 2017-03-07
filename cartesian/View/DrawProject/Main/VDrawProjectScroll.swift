import UIKit

class VDrawProjectScroll:UIScrollView
{
    private weak var controller:CDrawProject!
    private(set) weak var viewCanvas:VDrawProjectCanvas!
    private(set) weak var viewRules:VDrawProjectScrollRules!
    private let kInitialWidth:CGFloat = 3000
    private let kInitialHeight:CGFloat = 3000
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        contentSize = CGSize(
            width:kInitialWidth,
            height:kInitialHeight)
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        alwaysBounceVertical = true
        alwaysBounceHorizontal = true
        self.controller = controller
        
        let viewCanvas:VDrawProjectCanvas = VDrawProjectCanvas(
            controller:controller)
        self.viewCanvas = viewCanvas
        
        let viewRules:VDrawProjectScrollRules = VDrawProjectScrollRules(
            controller:controller)
        self.viewRules = viewRules
        
        addSubview(viewCanvas)
        addSubview(viewRules)
        
        NSLayoutConstraint.equals(
            view:viewRules,
            toView:self)
        
        canvasResize()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func canvasResize()
    {
        let frame:CGRect = CGRect(
            origin:CGPoint.zero,
            size:contentSize)
        
        viewCanvas.frame = frame
    }
    
    //MARK: public
    
    func centerPoint() -> CGPoint
    {
        let centerX:CGFloat = bounds.midX + contentInset.left
        let centerY:CGFloat = bounds.midY + contentInset.top
        let center:CGPoint = CGPoint(
            x:centerX,
            y:centerY)
        
        return center
    }
}
