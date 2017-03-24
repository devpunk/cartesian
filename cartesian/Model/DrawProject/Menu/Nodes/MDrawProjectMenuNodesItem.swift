import UIKit

class MDrawProjectMenuNodesItem
{
    let icon:UIImage
    let entityName:String
    let available:Bool
    
    init(icon:UIImage, entityName:String, available:Bool)
    {
        self.icon = icon
        self.entityName = entityName
        self.available = available
    }
}
