import UIKit
import CoreData

extension DNodeStarThree
{
    private static let kMediumDivisor:CGFloat = 3
    private static let kSides:Int = 3
    
    override func drawPaths(
        rect:CGRect,
        context:CGContext,
        zoom:CGFloat)
    {
        drawStar(
            rect:rect,
            context:context,
            initialAngle:-DNode.kPi_2,
            mediumDivisor:DNodeStarThree.kMediumDivisor,
            zoom:zoom,
            sides:DNodeStarThree.kSides)
    }
}
