import UIKit
import CoreData

extension DNodeStarFour
{
    private static let kInitialAngle:CGFloat = -CGFloat(M_PI_2)
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
            zoom:zoom,
            sides:DNodeStarFour.kSides)
    }
}
