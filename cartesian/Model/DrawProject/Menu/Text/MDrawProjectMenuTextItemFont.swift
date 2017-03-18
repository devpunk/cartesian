import UIKit

class MDrawProjectMenuTextItemFont:MDrawProjectMenuTextItem, MDrawProjectFontDelegate
{
    private weak var controller:CDrawProject?
    
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuTextItemFont_title", comment:"")
        
        super.init(
            title:title,
            image:#imageLiteral(resourceName: "assetGenericFont"))
    }
    
    override func selected(controller:CDrawProject)
    {
        self.controller = controller
        let titleFont:String = NSLocalizedString("MDrawProjectMenuTextItemFont_fontTitle", comment:"")
        controller.viewProject.showFont(
            title:titleFont,
            delegate:self)
    }
    
    //MARK: font delegate
    
    func fontCurrent() -> String?
    {
        guard
            
            let fontName:String = controller?.editingLabel?.viewSpatial.model?.fontName
        
        else
        {
            return nil
        }
        
        return fontName
    }
    
    func fontSelected(model:MDrawProjectMenuLabelsFontItem)
    {
        print(model.displayName())
    }
    
    func fontModel() -> MDrawProjectMenuLabelsFont?
    {
        return nil
    }
}
