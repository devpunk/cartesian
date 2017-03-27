import Foundation
import CoreData

extension DSettings
{
    private static let kDeltaTtl:Int16 = 1
    
    //MARK: public
    
    func becameActive()
    {
        ttl += DSettings.kDeltaTtl
        
        DManager.sharedInstance?.save()
    }
    
    func galleryPostsMap() -> [String:Bool]
    {
        var myItems:[String:Bool] = [:]
        
        if let galleryItemIds:[String] = galleryPost?.array as? [String]
        {
            for galleryItemId:String in galleryItemIds
            {
                myItems[galleryItemId] = true
            }
        }
        
        return myItems
    }
}
