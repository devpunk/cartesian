import UIKit

class MSettingsItemStore:MSettingsItem
{
    private let kCellHeight:CGFloat = 60
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
