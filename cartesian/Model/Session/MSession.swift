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
        { [weak self] (data) in
            
            guard
            
                let settings:DSettings = data?.first as? DSettings
            
            else
            {
                self?.createSession()
                
                return
            }
            
            settings.becameActive()
            self?.settings = settings
            self?.sessionLoaded()
        }
    }
    
    private func createSession()
    {
        DManager.sharedInstance?.createData(
            entityName:DSettings.entityName)
        { [weak self] (data) in
            
            guard
            
                let settings:DSettings = data as? DSettings
            
            else
            {
                return
            }
            
            self?.settings = settings
            self?.sessionLoaded()
        }
    }
    
    private func sessionLoaded()
    {
        if settings?.userId == nil
        {
            createFirebaseUser()
        }
    }
    
    private func createFirebaseUser()
    {
        let nodeUser:String = FDatabase.Node.user.rawValue
        FMain.sharedInstance.database?.createChild(
            path:nodeUser,
            json: <#T##Any#>)
        
        
        let modelUser:FDatabaseModelUser = FDatabaseModelUser(
            email:email,
            token:token,
            version:version)
        ttl = modelUser.session.ttl
        
        let userJson:Any = modelUser.modelJson()
        
        FMain.sharedInstance.database.updateChild(
            path:userPath,
            json:userJson)
    }
    
    //MARK: public
    
    func loadSession()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoadSession()
        }
    }
}
