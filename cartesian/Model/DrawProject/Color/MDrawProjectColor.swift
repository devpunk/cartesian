import UIKit

class MDrawProjectColor
{
    private(set) var items:[MDrawProjectColorItem]
    var selectedItem:Int
    
    init()
    {
        let systemCartesianBlue:MDrawProjectColorItemSystem = MDrawProjectColorItemSystem(
            color:UIColor.cartesianBlue)
        let systemCartesianGreen:MDrawProjectColorItemSystem = MDrawProjectColorItemSystem(
            color:UIColor.cartesianGreen)
        let systemBlack:MDrawProjectColorItemSystem = MDrawProjectColorItemSystem(
            color:UIColor.black)
        let systemWhite:MDrawProjectColorItemSystem = MDrawProjectColorItemSystem(
            color:UIColor.white)
        let systemRed:MDrawProjectColorItemSystem = MDrawProjectColorItemSystem(
            color:UIColor.red)
        let systemGreen:MDrawProjectColorItemSystem = MDrawProjectColorItemSystem(
            color:UIColor.green)
        let systemBlue:MDrawProjectColorItemSystem = MDrawProjectColorItemSystem(
            color:UIColor.blue)
        
        items = [
            systemCartesianBlue,
            systemCartesianGreen,
            systemBlack,
            systemWhite,
            systemRed,
            systemGreen,
            systemBlue]
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
