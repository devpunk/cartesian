import UIKit

class MSettingsItemStore:MSettingsItem
{
    private let kCellHeight:CGFloat = 50
    
    init()
    {
        let reusableIdentifier:String = VSettingsCellStore.reusableIdentifier
        
        super.init(
            cellHeight:kCellHeight,
            reusableIdentifier:reusableIdentifier)
    }
}
