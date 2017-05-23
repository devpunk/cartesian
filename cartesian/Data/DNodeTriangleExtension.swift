import UIKit
import CoreData

extension DNodeTriangle
{
    private static let kSides:Int = 3
    
    override func drawPaths(
        rect:CGRect,
        context:CGContext,
        zoom:CGFloat)
    {
        drawPolygon(
            rect:rect,
            context:context,
            initialAngle:-DNode.kPi_2,
            zoom:zoom,
            sides:DNodeTriangle.kSides)
    }
}
