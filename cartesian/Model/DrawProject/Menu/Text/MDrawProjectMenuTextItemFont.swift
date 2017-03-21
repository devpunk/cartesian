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
        controller.modelState.stateStand(controller:controller)
        controller.viewProject.viewMenu.viewBar.modeNormal()
        let titleFont:String = NSLocalizedString("MDrawProjectMenuTextItemFont_fontTitle", comment:"")
        controller.viewProject.showFont(
            title:titleFont,
            delegate:self)
    }
    
    //MARK: font delegate
    
    func fontCurrent() -> String?
    {
        guard
            
            let modelLabel:DLabel = controller?.editingView?.viewSpatial.model as? DLabel,
            let fontName:String = modelLabel.fontName
        
        else
        {
            return nil
        }
        
        return fontName
    }
    
    func fontSelected(model:MDrawProjectMenuLabelsFontItem)
    {
        guard
        
            let modelLabel:DLabel = controller?.editingView?.viewSpatial.model as? DLabel,
            let font:String = model.currentType
        
        else
        {
            return
        }
        
        controller?.endText()
        modelLabel.fontName = font
        modelLabel.updateGenerated()
        DManager.sharedInstance?.save()
        modelLabel.notifyDraw()
    }
    
    func fontModel() -> MDrawProjectMenuLabelsFont?
    {
        return nil
    }
}
