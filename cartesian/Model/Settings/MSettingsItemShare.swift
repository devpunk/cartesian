import UIKit

class MSettingsItemShare:MSettingsItem
{
    private let kCellHeight:CGFloat = 60
    private let kSelectable:Bool = true
    
    init()
    {
        let reusableIdentifier:String = VSettingsCellShare.reusableIdentifier
        
        super.init(
            cellHeight:kCellHeight,
            selectable:kSelectable,
            reusableIdentifier:reusableIdentifier)
    }
}
