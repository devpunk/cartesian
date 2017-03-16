import Foundation

class MDrawProjectFontType
{
    let items:[MDrawProjectFontTypeItem]
    
    init(model:MDrawProjectMenuLabelsFontItem)
    {
        var items:[MDrawProjectFontTypeItem] = []
        
        if model.typeRegular != nil
        {
            let itemRegular:MDrawProjectFontTypeItemRegular = MDrawProjectFontTypeItemRegular()
            items.append(itemRegular)
        }
        else if model.typeBold != nil
        {
            let itemBold:MDrawProjectFontTypeItemBold = MDrawProjectFontTypeItemBold()
            items.append(itemBold)
        }
        else if model.typeItalic != nil
        {
            let itemItalic:MDrawProjectFontTypeItemItalic = MDrawProjectFontTypeItemItalic()
            items.append(itemItalic)
        }
        
        self.items = items
    }
}
