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
        
        if let galleryPosts:[DGalleryPost] = self.galleryPost?.array as? [DGalleryPost]
        {
            for galleryPost:DGalleryPost in galleryPosts
            {
                guard
                    
                    let galleryItemId:String = galleryPost.galleryItemId
                
                else
                {
                    continue
                }
                
                myItems[galleryItemId] = true
            }
        }
        
        return myItems
    }
    
    func likedGalleryPost(galleryItemId:String) -> Bool
    {
        if let galleryLikes:[DGalleryLike] = self.galleryLike?.array as? [DGalleryLike]
        {
            for galleryLike:DGalleryLike in galleryLikes
            {
                if galleryLike.galleryItemId == galleryItemId
                {
                    return true
                }
            }
        }
        
        return false
    }
}
