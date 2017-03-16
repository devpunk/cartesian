import Foundation

class MDrawProjectMenuLabelsFont
{
    let items:[MDrawProjectMenuLabelsFontItem]
    var currentFont:MDrawProjectMenuLabelsFontItem?
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
            currentFont = nil
            
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
        
        currentFont = items.first
        self.items = items
    }
    
    //MARK: public
    
    func selectedIndex() -> IndexPath?
    {
        guard
            
            let currentFont:MDrawProjectMenuLabelsFontItem = self.currentFont
        
        else
        {
            return nil
        }
        
        var index:Int = 0
        
        for item:MDrawProjectMenuLabelsFontItem in items
        {
            if item === currentFont
            {
                break
            }
            
            index += 1
        }
        
        let indexPath:IndexPath = IndexPath(item:index, section:0)
        
        return indexPath
    }
    
    func indexForName(name:String) -> IndexPath?
    {
        let indexPath:IndexPath?
        var foundIndex:Int?
        var index:Int = 0
        
        for item:MDrawProjectMenuLabelsFontItem in items
        {
            if item.equalsName(name:name)
            {
                foundIndex = index
                
                break
            }
            
            index += 1
        }
        
        if let foundIndex:Int = foundIndex
        {
            indexPath = IndexPath(
                item:foundIndex,
                section:0)
        }
        else
        {
            indexPath = nil
        }
        
        return indexPath
    }
}
