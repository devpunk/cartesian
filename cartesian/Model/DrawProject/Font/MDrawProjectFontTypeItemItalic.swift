import Foundation

class MDrawProjectFontTypeItemItalic:MDrawProjectFontTypeItem
{
    init()
    {
        let name:String = NSLocalizedString("MDrawProjectFontTypeItemItalic_name", comment:"")
        super.init(name:name)
    }
    
    override func selected(model:MDrawProjectMenuLabelsFontItem)
    {
        model.currentType = model.typeItalic
    }
}
