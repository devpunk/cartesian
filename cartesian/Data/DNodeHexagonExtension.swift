import UIKit
import CoreData

extension DNodeHexagon
{
    private static let kInitialAngle:CGFloat = -CGFloat(M_PI_2)
    private static let kSides:Int = 6
    
    override func drawPaths(
        rect:CGRect,
        context:CGContext,
        zoom:CGFloat)
    {
        drawPolygon(
            rect:rect,
            context:context,
            initialAngle:DNodeHexagon.kInitialAngle,
            zoom:zoom,
            sides:DNodeHexagon.kSides)
    }
}
