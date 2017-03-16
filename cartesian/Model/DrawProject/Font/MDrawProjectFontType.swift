import Foundation

class MDrawProjectFontType
{
    let items:[MDrawProjectFontTypeItem]
    let indexPath:IndexPath?
    
    init(model:MDrawProjectMenuLabelsFontItem)
    {
        var items:[MDrawProjectFontTypeItem] = []
        var index:Int?
        
        if let typeRegular:String = model.typeRegular
        {
            let itemRegular:MDrawProjectFontTypeItemRegular = MDrawProjectFontTypeItemRegular()
            items.append(itemRegular)
            
            if typeRegular == model.currentType
            {
                index = 0
            }
        }
        
        if let typeBold:String = model.typeBold
        {
            let itemBold:MDrawProjectFontTypeItemBold = MDrawProjectFontTypeItemBold()
            items.append(itemBold)
            
            if typeBold == model.currentType
            {
                index = 1
            }
        }
        
        if let typeItalic:String = model.typeItalic
        {
            let itemItalic:MDrawProjectFontTypeItemItalic = MDrawProjectFontTypeItemItalic()
            items.append(itemItalic)
            
            if typeItalic == model.currentType
            {
                index = 2
            }
        }
        
        if let index:Int = index
        {
            indexPath = IndexPath(item:index, section:0)
        }
        else
        {
            indexPath = nil
        }
        
        self.items = items
    }
}
