import Foundation

class MGalleryItem
{
    var likes:Int
    let image:MGalleryItemImage
    let lastUpdated:TimeInterval
    let reusableIdentifier:String
    
    init(
        galleryItemId:String,
        galleryItem:FDatabaseModelGalleryItem,
        reusableIdentifier:String)
    {
        image = MGalleryItemImage(galleryItemId:galleryItemId)
        likes = galleryItem.likes
        lastUpdated = galleryItem.updated
        self.reusableIdentifier = reusableIdentifier
    }
}
