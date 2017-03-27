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
    
    //MARK: private
    
    private func asyncFetchGallery()
    {
        let nodeGallery:String = FDatabase.Node.gallery.rawValue
        
        FMain.sharedInstance.database.listenOnce(
            path:nodeGallery,
            modelType: <#T##ModelType.Type#>, completion: <#T##((ModelType?) -> ())##((ModelType?) -> ())##(ModelType?) -> ()#>)
    }
    
    //MARK: public
    
    func fetchGallery(controller:CGallery)
    {
        self.controller = controller
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncFetchGallery()
        }
    }
}
