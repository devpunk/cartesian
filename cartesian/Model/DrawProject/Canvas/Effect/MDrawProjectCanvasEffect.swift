import UIKit

class MDrawProjectCanvasEffect
{
    let items:[MDrawProjectCanvasEffectItem]
    private let kMinItems:Int = 3
    private let kPossibleItems:UInt32 = 3
    private let kBottomExpansion:UInt32 = 20
    private let kRemoveWidth:UInt32 = 80
    private let kAddWidth:CGFloat = 25
    
    init(width:CGFloat, height:CGFloat)
    {
        var items:[MDrawProjectCanvasEffectItem] = []
        
        let possibleItems:Int = Int(arc4random_uniform(kPossibleItems))
        let totalItems:Int = kMinItems + possibleItems
        let uInt32Width:UInt32 = UInt32(width)
        let totalWidth:UInt32
        
        if uInt32Width > kRemoveWidth
        {
            totalWidth = uInt32Width - kRemoveWidth
        }
        else
        {
             totalWidth = uInt32Width
        }
        
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
