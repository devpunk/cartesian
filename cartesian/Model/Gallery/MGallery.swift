import Foundation

class MGallery
{
    enum Sort
    {
        case time
        case likes
        case mine
    }
    
    private weak var controller:CGallery?
    private var allItems:[MGalleryItem]
    private(set) var displayItems:[MGalleryItem]
    private(set) var sorting:Sort
    
    init()
    {
        sorting = Sort.time
        allItems = []
        displayItems = []
    }
    
    //MARK: public
    
    func fetchGallery(controller:CGallery)
    {
        self.controller = controller
    }
}
