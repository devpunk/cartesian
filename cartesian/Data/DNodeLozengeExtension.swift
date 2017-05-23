import UIKit
import CoreData

extension DNodeLozenge
{
    private static let kSides:Int = 4
    
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
            sides:DNodeLozenge.kSides)
    }
}
