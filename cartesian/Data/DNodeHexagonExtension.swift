import UIKit
import CoreData

extension DNodeHexagon
{
    private static let kSides:Int = 6
    
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
            sides:DNodeHexagon.kSides)
    }
}
