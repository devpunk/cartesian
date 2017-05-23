import Foundation

class FDbUserItem:FDbProtocol
{
    static let created:String = "created"
    static let shouldPost:String = "shouldPost"
    
    let created:TimeInterval
    let shouldPost:Bool
    private let kShouldPost:Bool = true
    private let kShouldNotPost:Bool = false
    private let kNoTime:TimeInterval = 0
    
    init()
    {
        created = NSDate().timeIntervalSince1970
        shouldPost = kShouldPost
    }
    
    required init?(snapshot:Any)
    {
        let snapshotDict:[String:Any]? = snapshot as? [String:Any]
        
        if let created:TimeInterval = snapshotDict?[
            FDbUserItem.created] as? TimeInterval
        {
            self.created = created
        }
        else
        {
            self.created = kNoTime
        }
        
        if let shouldPost:Bool = snapshotDict?[
            FDbUserItem.shouldPost] as? Bool
        {
            self.shouldPost = shouldPost
        }
        else
        {
            self.shouldPost = kShouldNotPost
        }
    }
    
    func json() -> Any?
    {
        let json:[String:Any] = [
            FDbUserItem.created:created,
            FDbUserItem.shouldPost:shouldPost]
        
        return json
    }
}
