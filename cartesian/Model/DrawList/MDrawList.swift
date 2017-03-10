import Foundation

class MDrawList
{
    weak var controller:CDrawList?
    private(set) var items:[MDrawListItem]
    
    init()
    {
        items = []
    }
    
    //MARK: private
    
    private func asyncUpdate()
    {
        DManager.sharedInstance?.fetchData(
            entityName:DProject.entityName)
        { [weak self] (data) in
            
            guard
            
                let projects:[DProject] = data as? [DProject]
            
            else
            {
                return
            }
            
            var items:[MDrawListItem] = []
            
            for project:DProject in projects
            {
                let item:MDrawListItem = MDrawListItem(project:project)
                items.append(item)
            }
            
            items.sort
            { (itemA, itemB) -> Bool in
            
                return itemA.project.created > itemB.project.created
            }
            
            self?.items = items
            self?.controller?.listLoaded()
        }
    }
    
    //MARK: public
    
    func update()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncUpdate()
        }
    }
}
