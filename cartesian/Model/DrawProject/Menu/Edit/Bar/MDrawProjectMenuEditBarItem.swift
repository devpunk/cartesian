import UIKit

class MDrawProjectMenuEditBarItem
{
    let title:String
    let image:UIImage
    let keepSelected:Bool
    
    init(
        title:String,
        image:UIImage,
        keepSelected:Bool)
    {
        self.title = title
        self.image = image
        self.keepSelected = keepSelected
    }
    
    //MARK: public
    
    func selected(controller:CDrawProject)
    {
    }
}
