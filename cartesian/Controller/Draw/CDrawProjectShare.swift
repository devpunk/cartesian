import UIKit

class CDrawProjectShare:CController
{
    private weak var model:DProject!
    private weak var viewShare:VDrawProjectShare!
    
    init(model:DProject)
    {
        self.model = model
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func loadView()
    {
        let viewShare:VDrawProjectShare = VDrawProjectShare(
            controller:self)
        self.viewShare = viewShare
        view = viewShare
    }
}
