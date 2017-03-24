import UIKit
import CoreData

extension DNodePentagon
{
    private static let kInitialAngle:CGFloat = -CGFloat(M_PI_2)
    private static let kSides:Int = 5
    
    override func drawPaths(
        rect:CGRect,
        context:CGContext,
        zoom:CGFloat)
    {
        drawPolygon(
            rect:rect,
            context:context,
            initialAngle:DNodePentagon.kInitialAngle,
            zoom:zoom,
            sides:DNodePentagon.kSides)
    }
}
