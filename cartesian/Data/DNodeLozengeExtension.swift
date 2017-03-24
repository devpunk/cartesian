import UIKit
import CoreData

extension DNodeLozenge
{
    private static let kInitialAngle:CGFloat = -CGFloat(M_PI_2)
    private static let kSides:Int = 4
    
    override func drawPaths(
        rect:CGRect,
        context:CGContext,
        zoom:CGFloat)
    {
        drawPolygon(
            rect:rect,
            context:context,
            initialAngle:DNodeLozenge.kInitialAngle,
            zoom:zoom,
            sides:DNodeLozenge.kSides)
    }
}
