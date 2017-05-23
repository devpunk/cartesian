import Foundation

class MSession
{
    static let sharedInstance:MSession = MSession()
    private(set) var settings:DSettings?
    
    private init()
    {
    }
    
    //MARK: private
    
    private func asyncLoadSession()
    {
        DManager.sharedInstance?.fetchData(
            entityName:DSettings.entityName,
            limit:1)
        { (data) in
            
            guard
            
                let settings:DSettings = data?.first as? DSettings
            
            else
            {
                self.createSession()
                
                return
            }
            
            settings.becameActive()
            self.settings = settings
            self.sessionLoaded()
        }
    }
    
    private func createSession()
    {
        DManager.sharedInstance?.createData(
            entityName:DSettings.entityName)
        { (data) in
            
            guard
            
                let settings:DSettings = data as? DSettings
            
            else
            {
                return
            }
            
            self.settings = settings
            self.sessionLoaded()
        }
    }
    
    private func sessionLoaded()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        {
            if let userId:String = self.settings?.userId
            {
                self.loadFirebaseUser(userId:userId)
            }
            else
            {
                self.createFirebaseUser()
            }
        }
    }
    
    private func createFirebaseUser()
    {
        let modelUserItem:FDbUserItem = FDbUserItem()
        
        guard
            
            let userJson:Any = modelUserItem.json()
            
        else
        {
            return
        }
        
        let userId:String = FMain.sharedInstance.db.createChild(
            path:FDb.user,
            json:userJson)
        settings?.userId = userId
        DManager.sharedInstance?.save()
        
        fireBaseUserLoaded(modelUserItem:modelUserItem)
    }
    
    private func loadFirebaseUser(userId:String)
    {
        let path:String = "\(FDb.user)/\(userId)"
        
        FMain.sharedInstance.db.listenOnce(
            path:path,
            nodeType:FDbUserItem.self)
        { (data:FDbProtocol?) in
            
            guard
                
                let userItem:FDbUserItem = data as? FDbUserItem
                
            else
            {
                return
            }
            
            self.fireBaseUserLoaded(modelUserItem:userItem)
        }
    }
    
    private func fireBaseUserLoaded(modelUserItem:FDbUserItem)
    {
        settings?.shouldPost = modelUserItem.shouldPost
        DManager.sharedInstance?.save()
    }
    
    //MARK: public
    
    func loadSession()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        {
            self.asyncLoadSession()
        }
    }
}
