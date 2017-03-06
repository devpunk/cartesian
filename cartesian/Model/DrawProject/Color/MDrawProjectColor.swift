import UIKit

class MDrawProjectColor
{
    private(set) var items:[MDrawProjectColorItem]
    var selectedItem:Int
    
    init()
    {
        let systemBlue:MDrawProjectColorItemSystem = MDrawProjectColorItemSystem(
            color:UIColor.cartesianBlue)
        let systemGreen:MDrawProjectColorItemSystem = MDrawProjectColorItemSystem(
            color:UIColor.cartesianGreen)
        
        items = [
            systemBlue,
            systemGreen]
        selectedItem = 0
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.loadUserColors()
        }
    }
    
    //MARK: private
    
    private func loadUserColors()
    {
        DManager.sharedInstance?.fetchData(
            entityName:DColor.entityName)
        { [weak self] (data) in
            
            guard
            
                var colors:[DColor] = data as? [DColor]
            
            else
            {
                return
            }
            
            colors.sort
            { (colorA, colorB) -> Bool in
                
                return colorA.created < colorB.created
            }
            
            self?.insertUserColors(colors:colors)
        }
    }
    
    private func insertUserColors(colors:[DColor])
    {
        for color:DColor in colors
        {
            let itemUser:MDrawProjectColorItemUser = MDrawProjectColorItemUser(
                model:color)
            items.append(itemUser)
        }
    }
    
    //MARK: public
    
    func selectedColor() -> UIColor
    {
        let item:MDrawProjectColorItem = items[selectedItem]
        
        return item.color
    }
}
