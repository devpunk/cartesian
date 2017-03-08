import UIKit

class MDrawProjectMenuZoom
{
    enum RuleType
    {
        case horizontal
        case vertical
    }
    
    let items:[MDrawProjectMenuZoomItem]
    private(set) var currentItem:Int
    
    init()
    {
        let item10:MDrawProjectMenuZoomItem10 = MDrawProjectMenuZoomItem10()
        let item50:MDrawProjectMenuZoomItem50 = MDrawProjectMenuZoomItem50()
        let item100:MDrawProjectMenuZoomItem100 = MDrawProjectMenuZoomItem100()
        let item200:MDrawProjectMenuZoomItem200 = MDrawProjectMenuZoomItem200()
        let item300:MDrawProjectMenuZoomItem300 = MDrawProjectMenuZoomItem300()
        
        var items:[MDrawProjectMenuZoomItem] = []
        items.append(item10)
        items.append(item50)
        
        currentItem = items.count
        
        items.append(item100)
        items.append(item200)
        items.append(item300)
        
        self.items = items
    }
    
    //MARK: public
    
    func currentZoom() -> CGFloat
    {
        let zoom:CGFloat = items[currentItem].scalar
        
        return zoom
    }
    
    func currentZoomModel() -> MDrawProjectMenuZoomItem
    {
        let item:MDrawProjectMenuZoomItem = items[currentItem]
        
        return item
    }
    
    func increase()
    {
        currentItem += 1
    }
    
    func decrease()
    {
        currentItem -= 1
    }
}
