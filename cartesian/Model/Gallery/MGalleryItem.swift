import Foundation

class MGalleryItem
{
    let reusableIdentifier:String
    let image:MGalleryItemImage
    
    init(reusableIdentifier:String)
    {
        image = MGalleryItemImage()
        self.reusableIdentifier = reusableIdentifier
    }
}
