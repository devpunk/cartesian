import UIKit

class MSettingsItem
{
    let cellHeight:CGFloat
    let selectable:Bool
    let reusableIdentifier:String
    
    init(cellHeight:CGFloat, selectable:Bool, reusableIdentifier:String)
    {
        self.cellHeight = cellHeight
        self.selectable = selectable
        self.reusableIdentifier = reusableIdentifier
    }
}
