import UIKit

class VDrawProject:VView
{
    private weak var controller:CDrawProject!
    
    override init(controller:CController)
    {
        super.init(controller:controller)
        self.controller = controller as? CDrawProject
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
