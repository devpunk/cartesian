import UIKit
import CoreData

extension DNodeStarSix
{
    private static let kInitialAngle:CGFloat = -CGFloat.pi / 2.0
    private static let kMediumDivisor:CGFloat = 2
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
            mediumDivisor:DNodeStarSix.kMediumDivisor,
            zoom:zoom,
            sides:DNodeStarSix.kSides)
    }
}
