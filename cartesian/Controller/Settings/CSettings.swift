import UIKit

class CSettings:CController
{
    private weak var viewSettings:VSettings!
    let model:MSettings
    
    override init()
    {
        model = MSettings()
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func loadView()
    {
        let viewSettings:VSettings = VSettings(controller:self)
        self.viewSettings = viewSettings
        view = viewSettings
    }
}
