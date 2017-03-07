import UIKit

class VDrawProjectScroll:UIScrollView
{
    private weak var controller:CDrawProject!
    private(set) weak var viewCanvas:VDrawProjectCanvas!
    private let kInitialWidth:CGFloat = 3000
    private let kInitialHeight:CGFloat = 3000
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        contentSize = CGSize(width:kInitialWidth, height:kInitialHeight)
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        alwaysBounceVertical = true
        alwaysBounceHorizontal = true
        self.controller = controller
        
        let viewCanvas:VDrawProjectCanvas = VDrawProjectCanvas(
            controller:controller)
        self.viewCanvas = viewCanvas
        
        addSubview(viewCanvas)
        
        canvasResize()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
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
        let centerX:CGFloat = bounds.midX + contentInset.left
        let centerY:CGFloat = bounds.midY + contentInset.top
        let center:CGPoint = CGPoint(
            x:centerX,
            y:centerY)
        
        return center
    }
}
