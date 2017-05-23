import Foundation
import Firebase

class FMain
{
    static let sharedInstance:FMain = FMain()
    let analytics:FAnalytics
    let db:FDb
    let storage:FStorage
    
    private init()
    {
        FirebaseApp.configure()
        analytics = FAnalytics()
        db = FDb()
        storage = FStorage()
    }
    
    //MARK: public
    
    func load()
    {
    }
}
