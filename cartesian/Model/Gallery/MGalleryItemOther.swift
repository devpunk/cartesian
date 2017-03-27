import Foundation

class MGalleryItemOther:MGalleryItem
{
    init(
        galleryItemId:String,
        galleryItem:FDatabaseModelGalleryItem)
    {
        let reusableIdentifier:String = VGalleryFooterOther.reusableIdentifier
        
        super.init(
            galleryItemId:galleryItemId,
            galleryItem:galleryItem,
            reusableIdentifier:reusableIdentifier)
    }
}
