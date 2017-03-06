import UIKit

class MDrawProjectMenuZoom
{
    let items:[CGFloat]
    var currentItem:Int
    private let kResourceName:String = "ResourceZoom"
    private let kResourceExtension:String = "plist"
    private let kInitialSelected:Int = 4
    private let kNoListDefaultItem:CGFloat = 1
    
    init()
    {
        guard
            
            let resourceUrl:URL = Bundle.main.url(
                forResource:kResourceName,
                withExtension:kResourceExtension),
            let zoomArray:NSArray = NSArray(
                contentsOf:resourceUrl),
            let items:[CGFloat] = zoomArray as? [CGFloat]
            
        else
        {
            self.items = [kNoListDefaultItem]
            currentItem = 0
            
            return
        }
        
        self.items = items
        
        if items.count > kInitialSelected
        {
            currentItem = kInitialSelected
        }
        else
        {
            currentItem = 0
        }
    }
    
    //MARK: public
    
    func currentZoom() -> CGFloat
    {
        let zoom:CGFloat = items[currentItem]
        
        return zoom
    }
}
