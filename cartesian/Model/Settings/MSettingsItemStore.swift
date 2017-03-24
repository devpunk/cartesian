import UIKit

class MSettingsItemStore:MSettingsItem
{
    private let kCellHeight:CGFloat = 70
    private let kSelectable:Bool = true
    
    init()
    {
        let reusableIdentifier:String = VSettingsCellStore.reusableIdentifier
        
        super.init(
            cellHeight:kCellHeight,
            selectable:kSelectable,
            reusableIdentifier:reusableIdentifier)
    }
}
