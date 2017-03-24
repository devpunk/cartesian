import UIKit

class MSettingsItemShare:MSettingsItem
{
    private let kCellHeight:CGFloat = 70
    private let kSelectable:Bool = true
    
    init()
    {
        let reusableIdentifier:String = VSettingsCellShare.reusableIdentifier
        
        super.init(
            cellHeight:kCellHeight,
            selectable:kSelectable,
            reusableIdentifier:reusableIdentifier)
    }
    
    override func selected(controller:CSettings)
    {
        controller.share()
    }
}
