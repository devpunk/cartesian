import UIKit

class MDrawProjectMenuTextItemTrash:MDrawProjectMenuTextItem
{
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuTextItemTrash_title", comment:"")
        
        super.init(
            title:title,
            image:#imageLiteral(resourceName: "assetGenericTrash"))
    }
    
    override func selected(controller:CDrawProject)
    {
        UIApplication.shared.keyWindow!.endEditing(true)
        
        let alert:UIAlertController = UIAlertController(
            title:NSLocalizedString("MDrawProjectMenuTextItemTrash_alertTitle", comment:""),
            message:nil,
            preferredStyle:UIAlertControllerStyle.actionSheet)
        
        let actionCancel:UIAlertAction = UIAlertAction(
            title:
            NSLocalizedString("MDrawProjectMenuTextItemTrash_alertCancel", comment:""),
            style:
            UIAlertActionStyle.cancel)
        
        let actionDelete:UIAlertAction = UIAlertAction(
            title:
            NSLocalizedString("MDrawProjectMenuTextItemTrash_alertDelete", comment:""),
            style:
            UIAlertActionStyle.destructive)
        { [weak controller] (action:UIAlertAction) in
            
            controller?.trashEditing()
        }
        
        alert.addAction(actionDelete)
        alert.addAction(actionCancel)
        
        if let popover:UIPopoverPresentationController = alert.popoverPresentationController
        {
            popover.sourceView = controller.viewProject
            popover.sourceRect = CGRect.zero
            popover.permittedArrowDirections = UIPopoverArrowDirection.up
        }
        
        controller.present(alert, animated:true, completion:nil)
    }
}
