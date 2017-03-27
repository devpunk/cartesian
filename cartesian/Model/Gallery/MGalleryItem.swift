import Foundation

class MGalleryItem
{
    let image:MGalleryItemImage
    let likes:Int
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
