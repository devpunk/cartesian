import UIKit

class MDrawProjectMenuNodesItem
{
    let icon:UIImage
    let entityName:String
    let title:String
    let available:Bool
    
    init(
        icon:UIImage,
        entityName:String,
        title:String,
        available:Bool)
    {
        self.icon = icon
        self.entityName = entityName
        self.available = available
    }
}
