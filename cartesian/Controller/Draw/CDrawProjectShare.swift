import UIKit

class CDrawProjectShare:CController
{
    private weak var model:DProject!
    
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
        
    }
}
