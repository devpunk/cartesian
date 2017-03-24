import UIKit

class VDrawProjectStore:UIView
{
    private weak var controller:CDrawProject!
    private weak var purchase:MDrawProjectMenuNodesItem!
    
    init(
        controller:CDrawProject,
        purchase:MDrawProjectMenuNodesItem)
    {
        super.init(frame:CGRect.zero)
        self.controller = controller
        self.purchase = purchase
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
