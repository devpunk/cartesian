import UIKit

class MDrawProjectColor
{
    let items:[MDrawProjectColorItem]
    
    init()
    {
        let systemBlue:MDrawProjectColorItemSystem = MDrawProjectColorItemSystem(
            color:UIColor.cartesianBlue)
        let systemGreen:MDrawProjectColorItemSystem = MDrawProjectColorItemSystem(
            color:UIColor.cartesianGreen)
        
        items = [
            systemBlue,
            systemGreen]
    }
}
