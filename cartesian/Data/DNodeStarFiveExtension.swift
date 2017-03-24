import UIKit
import CoreData

extension DNodeStarFive
{
    private static let kInitialAngle:CGFloat = -CGFloat(M_PI_2)
    private static let kMediumDivisor:CGFloat = 2
    private static let kSides:Int = 5
    
    override func drawPaths(
        rect:CGRect,
        context:CGContext,
        zoom:CGFloat)
    {
        drawStar(
            rect:rect,
            context:context,
            initialAngle:DNodeStarFive.kInitialAngle,
            mediumDivisor:DNodeStarFive.kMediumDivisor,
            zoom:zoom,
            sides:DNodeStarFive.kSides)
    }
}
