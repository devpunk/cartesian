import UIKit

class VDrawProjectScroll:UIScrollView, UIScrollViewDelegate
{
    weak var viewRules:VDrawProjectRules!
    private(set) weak var viewCanvas:VDrawProjectCanvas!
    private weak var controller:CDrawProject!
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor(white:0.97, alpha:1)
        translatesAutoresizingMaskIntoConstraints = false
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        alwaysBounceVertical = true
        alwaysBounceHorizontal = true
        delegate = self
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
    
    func scrollViewWillBeginDragging(_ scrollView:UIScrollView)
    {
        controller.modelState.current?.canvasStartDragging(
            scrollView:scrollView)
    }
    
    func scrollViewDidScroll(_ scrollView:UIScrollView)
    {
        viewRules.scrollDidScroll(offset:scrollView.contentOffset)
    }
    
    //MARK: private
    
    private func canvasResize()
    {
        guard
            
            let contentWidth:Int16 = controller.model?.width,
            let contentHeight:Int16 = controller.model?.height
        
        else
        {
            return
        }
        
        let width:CGFloat = CGFloat(contentWidth)
        let height:CGFloat = CGFloat(contentHeight)
        let zoom:CGFloat = controller.modelZoom.currentZoom()
        let zoomedWidth:CGFloat = width * zoom
        let zoomedHeight:CGFloat = height * zoom
        
        contentSize = CGSize(
            width:zoomedWidth,
            height:zoomedHeight)
        
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
    
    func centerOn(point:CGPoint)
    {
        let width:CGFloat = bounds.size.width
        let height:CGFloat = bounds.size.height
        let width_2:CGFloat = width / 2.0
        let height_2:CGFloat = height / 2.0
        let rect:CGRect = CGRect(
            x:point.x - width_2,
            y:point.y - height_2,
            width:width,
            height:height)
        
        scrollRectToVisible(rect, animated:true)
    }
    
    func centerTopOn(point:CGPoint)
    {
        let width:CGFloat = bounds.size.width
        let height:CGFloat = bounds.size.height
        let width_2:CGFloat = width / 2.0
        let height_4:CGFloat = height / 4.0
        let rect:CGRect = CGRect(
            x:point.x - width_2,
            y:point.y - height_4,
            width:width,
            height:height)
        
        scrollRectToVisible(rect, animated:true)
    }
    
    func refresh()
    {
        canvasResize()
        viewCanvas.draw()
        viewRules.setNeedsDisplay()
    }
}
