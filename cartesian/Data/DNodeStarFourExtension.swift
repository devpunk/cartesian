import UIKit
import CoreData

extension DNodeStarFour
{
    private static let kInitialAngle:CGFloat = -CGFloat.pi / 4
    private static let kMediumDivisor:CGFloat = 2
    private static let kSides:Int = 4
    
    override func drawPaths(
        rect:CGRect,
        context:CGContext,
        zoom:CGFloat)
    {
        drawStar(
            rect:rect,
            context:context,
            initialAngle:DNodeStarFour.kInitialAngle,
            mediumDivisor:DNodeStarFour.kMediumDivisor,
            zoom:zoom,
            sides:DNodeStarFour.kSides)
    }
}
