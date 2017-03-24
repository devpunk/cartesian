import UIKit
import CoreData

extension DNodeStarSix
{
    private static let kInitialAngle:CGFloat = -CGFloat(M_PI_2)
    private static let kSides:Int = 6
    
    override func drawPaths(
        rect:CGRect,
        context:CGContext,
        zoom:CGFloat)
    {
        drawStar(
            rect:rect,
            context:context,
            initialAngle:DNodeStarSix.kInitialAngle,
            zoom:zoom,
            sides:DNodeStarSix.kSides)
    }
}
