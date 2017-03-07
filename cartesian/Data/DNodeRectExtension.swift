import UIKit
import CoreData

extension DNodeRect
{
    override func drawPaths(
        rect:CGRect,
        context:CGContext)
    {
        let modelWidth:CGFloat = CGFloat(self.width)
        let modelHeight:CGFloat = CGFloat(self.height)
        
        let width:CGFloat = rect.size.width
        let height:CGFloat = rect.size.height
        let deltaWidth:CGFloat = width - modelWidth
        let deltaHeight:CGFloat = height - modelHeight
        let deltaWidth_2:CGFloat = deltaWidth / 2.0
        let deltaHeight_2:CGFloat = deltaHeight / 2.0
        let rect:CGRect = CGRect(
            x:deltaWidth_2,
            y:deltaHeight_2,
            width:modelWidth,
            height:modelHeight)
        
        context.addRect(rect)
        context.drawPath(using:CGPathDrawingMode.fillStroke)
    }
}
