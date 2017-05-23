import Foundation

class MGalleryItemMine:MGalleryItem
{
    init(
        galleryItemId:String,
        galleryItem:FDbGalleryItem)
    {
        let reusableIdentifier:String = VGalleryFooterMine.reusableIdentifier
        
        super.init(
            galleryItemId:galleryItemId,
            galleryItem:galleryItem,
            reusableIdentifier:reusableIdentifier)
    }
}
