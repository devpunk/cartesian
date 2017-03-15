import Foundation

class MDrawProjectMenuLabelsFont
{
    let items:[MDrawProjectMenuLabelsFontItem]
    private let kResourceName:String = "ResourceFont"
    private let kResourceExtension:String = "plist"
    
    init()
    {
        guard
            
            let resourceFont:URL = Bundle.main.url(
                forResource:kResourceName,
                withExtension:kResourceExtension),
            let fontArray:NSArray = NSArray(
                contentsOf:resourceFont),
            let fontList:[[String:AnyObject]] = fontArray as? [[String:AnyObject]]
            
        else
        {
            self.items = []
            
            return
        }
        
        var items:[MDrawProjectMenuLabelsFontItem] = []
        
        for font:[String:AnyObject] in fontList
        {
            let item:MDrawProjectMenuLabelsFontItem = MDrawProjectMenuLabelsFontItem(
                raw:font)
            items.append(item)
        }
        
        items.sort
        { (itemA, itemB) -> Bool in
            
            let comparisonResult:ComparisonResult = itemA.name.compare(itemB.name)
            
            switch comparisonResult
            {
            case ComparisonResult.orderedAscending,
                 ComparisonResult.orderedSame:
                
                return true
                
            case ComparisonResult.orderedDescending:
                
                return false
            }
        }
        
        self.items = items
    }
}
