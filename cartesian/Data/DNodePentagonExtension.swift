import UIKit
import CoreData

extension DNodePentagon
{
    private static let kSides:Int = 5
    
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
            sides:DNodePentagon.kSides)
    }
}
