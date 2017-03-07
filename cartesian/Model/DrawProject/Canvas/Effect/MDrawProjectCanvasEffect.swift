import UIKit

class MDrawProjectCanvasEffect
{
    let items:[MDrawProjectCanvasEffectItem]
    private let kMinItems:Int = 3
    private let kPossibleItems:UInt32 = 3
    private let kBottomExpansion:UInt32 = 20
    private let kRemoveWidth:UInt32 = 60
    private let kAddWidth:CGFloat = 20
    
    init(width:CGFloat, height:CGFloat)
    {
        var items:[MDrawProjectCanvasEffectItem] = []
        
        let possibleItems:Int = Int(arc4random_uniform(kPossibleItems))
        let totalItems:Int = kMinItems + possibleItems
        let totalWidth:UInt32 = UInt32(width) - kRemoveWidth
        
        for _:Int in 0 ..< totalItems
        {
            let positionX:CGFloat = CGFloat(arc4random_uniform(totalWidth)) + kAddWidth
            let rawPositionY:CGFloat = CGFloat(arc4random_uniform(kBottomExpansion))
            let positionY:CGFloat = height - rawPositionY
            let item:MDrawProjectCanvasEffectItem = MDrawProjectCanvasEffectItem(
                positionX:positionX,
                positionY:positionY)
            items.append(item)
        }

        self.items = items
    }
}
