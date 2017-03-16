import Foundation

class MDrawProjectFontTypeItemBold:MDrawProjectFontTypeItem
{
    init()
    {
        let name:String = NSLocalizedString("MDrawProjectFontTypeItemBold_name", comment:"")
        super.init(name:name)
    }
    
    override func selected(model:MDrawProjectMenuLabelsFontItem)
    {
        model.currentType = model.typeBold
    }
}
