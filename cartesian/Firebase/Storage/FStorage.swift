import Foundation
import FirebaseStorage

class FStorage
{
    enum Folder:String
    {
        case gallery = "gallery"
    }
    
    private let reference:StorageReference
    private let kTenMegaBytes:Int64 = 10000000
    
    init()
    {
        reference = Storage.storage().reference()
    }
    
    //MARK: public
    
    func saveData(path:String, data:Data, completionHandler:@escaping((String?) -> ()))
    {
        let childReference:FIRStorageReference = reference.child(path)
        childReference.put(
            data,
            metadata:nil)
        { (metaData:FIRStorageMetadata?, error:Error?) in
            
            let errorString:String? = error?.localizedDescription
            completionHandler(errorString)
        }
    }
    
    func loadData(path:String, completionHandler:@escaping((Data?, Error?) -> ()))
    {
        let childReference:FIRStorageReference = reference.child(path)
        childReference.data(
            withMaxSize:kTenMegaBytes,
            completion:completionHandler)
    }
    
    func deleteData(path:String, completionHandler:@escaping((Error?) -> ()))
    {
        let childReference:FIRStorageReference = reference.child(path)
        childReference.delete(completion:completionHandler)
    }
}
