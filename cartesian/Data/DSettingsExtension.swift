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
}
