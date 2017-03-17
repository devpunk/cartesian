import UIKit

class MDrawProjectMenuTextItem
{
    let title:String
    let image:UIImage
    
    init(
        title:String,
        image:UIImage)
    {
        self.title = title
        self.image = image
    }
    
    //MARK: public
    
    func selected(controller:CDrawProject)
    {
    }
}
