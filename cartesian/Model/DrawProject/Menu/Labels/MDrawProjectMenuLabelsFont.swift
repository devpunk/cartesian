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
            let fontList:[AnyObject] = fontArray as? [AnyObject]
            
        else
        {
            self.items = []
            
            return
        }
        
        var items:[MDrawProjectMenuLabelsFontItem] = []
        
        for font:AnyObject in fontList
        {
            
        }
        
        self.items = items
    }
}
