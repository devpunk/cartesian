import Foundation
import Firebase

class FMain
{
    static let sharedInstance:FMain = FMain()
    private(set) var analytics:FAnalytics?
    private(set) var database:FDatabase?
    private(set) var storage:FStorage?
    
    private init()
    {
    }
    
    //MARK: public
    
    func load()
    {
        FIRApp.configure()
        
        #if DEBUG
            
            analytics = nil
            
        #else
            
            analytics = FAnalytics()
            
        #endif
        
        database = FDatabase()
        storage = FStorage()
    }
}
