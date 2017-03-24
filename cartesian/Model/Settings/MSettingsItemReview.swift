import UIKit

class MSettingsItemReview:MSettingsItem
{
    private let kCellHeight:CGFloat = 70
    private let kSelectable:Bool = true
    
    init()
    {
        let reusableIdentifier:String = VSettingsCellReview.reusableIdentifier
        
        super.init(
            cellHeight:kCellHeight,
            selectable:kSelectable,
            reusableIdentifier:reusableIdentifier)
    }
    
    override func selected(controller:CSettings)
    {
        controller.review()
    }
}
