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
            modelType:FDatabaseModelGallery.self)
        { [weak self] (data:FDatabaseModelGallery?) in
            
            guard
            
                let gallery:FDatabaseModelGallery = data
            
            else
            {
                self?.controller?.galleryLoaded()
                
                return
            }
            
            self?.galleryFetched(gallery:gallery)
        }
    }
    
    private func galleryFetched(gallery:FDatabaseModelGallery)
    {
        guard
        
            let posts:[String:Bool] = MSession.sharedInstance.settings?.galleryPostsMap()
        
        else
        {
            controller?.galleryLoaded()
            
            return
        }
        
        postsFetched(
            gallery:gallery,
            posts:posts)
    }
    
    private func postsFetched(
        gallery:FDatabaseModelGallery,
        posts:[String:Bool])
    {
        var allItems:[MGalleryItem] = []
        let itemIds:[String] = Array(gallery.items.keys)
        
        for itemId:String in itemIds
        {
            guard
                
                let galleryItem:FDatabaseModelGalleryItem = gallery.items[itemId]
            
            else
            {
                continue
            }
            
            let item:MGalleryItem
            
            
            if let _:Bool = posts[itemId]
            {
                item = MGalleryItemMine(
                    galleryItemId:itemId,
                    galleryItem:galleryItem)
            }
            else
            {
                item = MGalleryItemOther(
                    galleryItemId:itemId,
                    galleryItem:galleryItem)
            }
            
            allItems.append(item)
        }
        
        self.allItems = allItems
        updateDisplayItems()
        controller?.galleryLoaded()
    }
    
    private func updateDisplayItems()
    {
        var displayItems:[MGalleryItem] = []
        
        switch sorting
        {
        case Sort.time:
            
            displayItems = allItems.sorted
            { (itemA:MGalleryItem, itemB:MGalleryItem) -> Bool in
                
                return itemA.lastUpdated > itemB.lastUpdated
            }
            
            break
            
        case Sort.likes:
            
            displayItems = allItems.sorted
            { (itemA:MGalleryItem, itemB:MGalleryItem) -> Bool in
                
                return itemA.likes > itemB.likes
            }
            
            break
            
        case Sort.mine:
            
            for item:MGalleryItem in allItems
            {
                guard
                
                    let mine:MGalleryItemMine = item as? MGalleryItemMine
                
                else
                {
                    continue
                }
                
                displayItems.append(mine)
            }
            
            displayItems.sort
            { (itemA, itemB) -> Bool in
                
                return itemA.lastUpdated > itemB.lastUpdated
            }
            
            break
        }
        
        self.displayItems = displayItems
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
