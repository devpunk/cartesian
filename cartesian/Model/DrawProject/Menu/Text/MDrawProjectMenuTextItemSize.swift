import UIKit

class MDrawProjectMenuTextItemSize:MDrawProjectMenuTextItem, MDrawProjectFontSizeDelegate
{
    private weak var controller:CDrawProject?
    
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuTextItemSize_title", comment:"")
        
        super.init(
            title:title,
            image:#imageLiteral(resourceName: "assetGenericFontSize"))
    }
    
    override func selected(controller:CDrawProject)
    {
        self.controller = controller
        controller.modelState.stateStand(controller:controller)
        controller.viewProject.viewMenu.viewBar.modeNormal()
        controller.viewProject.showFontSize(delegate:self)
    }
    
    //MARK: fontSize delegate
    
    func fontSizeSelected(size:Int16)
    {
        let modelLabel:DLabel? = controller?.editingLabel?.viewSpatial.model
        
        controller?.endText()
        modelLabel?.fontSize = size
        modelLabel?.updateGenerated()
        DManager.sharedInstance?.save()
        
        modelLabel?.notifyDraw()
    }
    
    func fontCurrentSize() -> Int16?
    {
        guard
        
            let currentSize:Int16 = controller?.editingLabel?.viewSpatial.model?.fontSize
        
        else
        {
            return nil
        }
        
        return currentSize
    }
}
