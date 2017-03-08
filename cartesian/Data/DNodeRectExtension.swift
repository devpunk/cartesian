import UIKit
import CoreData

extension DNodeRect
{
    override func drawPaths(
        rect:CGRect,
        context:CGContext)
    {
        var modelWidth:CGFloat = CGFloat(self.width)
        var modelHeight:CGFloat = CGFloat(self.height)
        let width:CGFloat = rect.size.width
        let height:CGFloat = rect.size.height
        let deltaSpaceWidth:CGFloat = modelWidth - width
        let deltaSpaceHeight:CGFloat = modelHeight - height
        
        if deltaSpaceWidth > 0 || deltaSpaceHeight > 0
        {
            let ratio:CGFloat
            
            if deltaSpaceWidth >= deltaSpaceHeight
            {
                ratio = modelWidth / width
            }
            else
            {
                ratio = modelHeight / height
            }
            
            modelWidth = modelWidth / ratio
            modelHeight = modelHeight / ratio
        }
        
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
