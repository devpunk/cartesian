import Foundation

class FDbGalleryItem:FDbProtocol
{
    static let available:String = "available"
    static let created:String = "created"
    static let updated:String = "updated"
    static let userId:String = "userId"
    static let likes:String = "likes"
    
    let available:Bool
    let created:TimeInterval
    let updated:TimeInterval
    let userId:String
    let likes:Int
    private let kInitialLikes:Int = 0
    private let kInitialAvailability:Bool = true
    private let kNoTime:TimeInterval = 0
    private let kNotAvailable:Bool = false
    
    init?(userId:String)
    {
        available = kInitialAvailability
        created = NSDate().timeIntervalSince1970
        updated = created
        likes = kInitialLikes
        self.userId = userId
    }
    
    required init?(snapshot:Any)
    {
        let snapshotDict:[String:Any]? = snapshot as? [String:Any]
        
        if let available:Bool = snapshotDict?[
            FDbGalleryItem.available] as? Bool
        {
            self.available = available
        }
        else
        {
            self.available = kNotAvailable
        }
        
        if let created:TimeInterval = snapshotDict?[
            FDbGalleryItem.created] as? TimeInterval
        {
            self.created = created
        }
        else
        {
            self.created = kNoTime
        }
        
        if let updated:TimeInterval = snapshotDict?[
            FDbGalleryItem.updated] as? TimeInterval
        {
            self.updated = updated
        }
        else
        {
            self.updated = kNoTime
        }
        
        if let likes:Int = snapshotDict?[
            FDbGalleryItem.likes] as? Int
        {
            
            self.likes = likes
        }
        else
        {
            self.likes = kInitialLikes
        }
        
        guard
            
            let userId:String = snapshotDict?[
                FDbGalleryItem.userId] as? String
            
            else
        {
            return nil
        }
        
        self.userId = userId
    }
    
    func json() -> Any?
    {
        let json:[String:Any] = [
            FDbGalleryItem.available:available,
            FDbGalleryItem.created:created,
            FDbGalleryItem.updated:updated,
            FDbGalleryItem.likes:likes,
            FDbGalleryItem.userId:userId
        ]
        
        return json
    }
}
