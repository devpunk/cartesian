import UIKit

class MDrawProjectMenuZoom
{
    enum RuleType
    {
        case horizontal
        case vertical
    }
    
    let items:[MDrawProjectMenuZoomItem]
    var currentItem:Int
    
    init()
    {
        let item50:MDrawProjectMenuZoomItem50 = MDrawProjectMenuZoomItem50()
        let item100:MDrawProjectMenuZoomItem100 = MDrawProjectMenuZoomItem100()
        let item200:MDrawProjectMenuZoomItem200 = MDrawProjectMenuZoomItem200()
        
        var items:[MDrawProjectMenuZoomItem] = []
        items.append(item50)
        
        currentItem = items.count
        items.append(item100)
        items.append(item200)
        
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
}
