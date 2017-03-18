import UIKit

class MDrawProjectMenuTextItemFont:MDrawProjectMenuTextItem, MDrawProjectFontDelegate
{
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuTextItemFont_title", comment:"")
        
        super.init(
            title:title,
            image:#imageLiteral(resourceName: "assetGenericFont"))
    }
    
    override func selected(controller:CDrawProject)
    {
        let titleFont:String = NSLocalizedString("MDrawProjectMenuTextItemFont_fontTitle", comment:"")
        controller.viewProject.showFont(
            title:titleFont,
            delegate:self)
    }
    
    //MARK: font delegate
    
    func fontCurrent() -> String?
    {
        let currentFont:String? = model.currentFont?.displayName()
        
        return currentFont
    }
    
    func fontSelected(model:MDrawProjectMenuLabelsFontItem)
    {
        updateFont()
    }
    
    func fontModel() -> MDrawProjectMenuLabelsFont?
    {
        return model
    }
}
