import Foundation

class MDrawProjectFontTypeItemRegular:MDrawProjectFontTypeItem
{
    init()
    {
        let name:String = NSLocalizedString("MDrawProjectFontTypeItemRegular_name", comment:"")
        super.init(name:name)
    }
    
    override func selected(model:MDrawProjectMenuLabelsFontItem)
    {
        model.currentType = model.typeRegular
    }
}
