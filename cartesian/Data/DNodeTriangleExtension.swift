import UIKit
import CoreData

extension DNodeTriangle
{
    private static let kInitialAngle:CGFloat = -CGFloat(M_PI_2)
    private static let kSides:Int = 3
    
    override func drawPaths(
        rect:CGRect,
        context:CGContext,
        zoom:CGFloat)
    {
        drawPolygon(
            rect:rect,
            context:context,
            initialAngle:DNodeTriangle.kInitialAngle,
            zoom:zoom,
            sides:DNodeTriangle.kSides)
    }
}
