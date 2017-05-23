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
        FMain.sharedInstance.db.listenOnce(
            path:FDb.gallery,
            nodeType:FDbGallery.self)
        { [weak self] (data:FDbProtocol?) in
            
            guard
            
                let gallery:FDbGallery = data as? FDbGallery
            
            else
            {
                self?.controller?.galleryLoaded()
                
                return
            }
            
            self?.galleryFetched(gallery:gallery)
        }
    }
    
    private func galleryFetched(gallery:FDbGallery)
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
        gallery:FDbGallery,
        posts:[String:Bool])
    {
        var allItems:[MGalleryItem] = []
        let itemIds:[String] = Array(gallery.items.keys)
        
        for itemId:String in itemIds
        {
            guard
                
                let galleryItem:FDbGalleryItem = gallery.items[itemId]
            
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
    
    func sortGallery(sorting:Sort)
    {
        self.sorting = sorting
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.updateDisplayItems()
            self?.controller?.galleryLoaded()
        }
    }
}
