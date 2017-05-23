import Foundation

class FDbGallery:FDbProtocol
{
    static let items:String = "items"
    
    let items:[String:FDbGalleryItem]
    
    required init?(snapshot:Any)
    {
        guard
            
            let snapshotDict:[String:Any] = snapshot as? [String:Any]
            
        else
        {
            return nil
        }
        
        var items:[String:FDbGalleryItem] = [:]
        let allKeys:[String] = Array(snapshotDict.keys)
        
        for itemKey:String in allKeys
        {
            guard
                
                let snapshot:Any = snapshotDict[itemKey],
                let itemGallery:FDbGalleryItem = FDbGalleryItem(snapshot:snapshot)
                
            else
            {
                continue
            }
            
            items[itemKey] = itemGallery
        }
        
        self.items = items
    }
    
    func json() -> Any?
    {
        return nil
    }
}
