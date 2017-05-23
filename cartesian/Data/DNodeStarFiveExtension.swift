import UIKit
import CoreData

extension DNodeStarFive
{
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
            initialAngle:-DNode.kPi_2,
            mediumDivisor:DNodeStarFive.kMediumDivisor,
            zoom:zoom,
            sides:DNodeStarFive.kSides)
    }
}
