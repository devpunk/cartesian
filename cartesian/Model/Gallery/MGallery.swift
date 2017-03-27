import Foundation

class MGallery
{
    enum Sort
    {
        case time
        case likes
        case mine
    }
    
    private weak var controller:CGallery!
    private(set) var items:[MGalleryItem]
    private(set) var sorting:Sort
    
    init(controller:CGallery)
    {
        self.controller = controller
        sorting = Sort.time
        items = []
    }
    
    //MARK: public
    
    func fetchGallery()
    {
        
    }
}
