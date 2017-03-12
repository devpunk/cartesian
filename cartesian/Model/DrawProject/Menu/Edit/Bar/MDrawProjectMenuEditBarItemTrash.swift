import UIKit

class MDrawProjectMenuEditBarItemTrash:MDrawProjectMenuEditBarItem
{
    init()
    {
        let title:String = NSLocalizedString("MDrawProjectMenuEditBarItemTrash_title", comment:"")
        
        super.init(
            title:title,
            image:#imageLiteral(resourceName: "assetGenericTrash"))
    }
    
    override func selected(controller:CDrawProject)
    {
        UIApplication.shared.keyWindow!.endEditing(true)
        
        let alert:UIAlertController = UIAlertController(
            title:NSLocalizedString("MDrawProjectMenuEditBarItemTrash_alertTitle", comment:""),
            message:nil,
            preferredStyle:UIAlertControllerStyle.actionSheet)
        
        let actionCancel:UIAlertAction = UIAlertAction(
            title:
            NSLocalizedString("MDrawProjectMenuEditBarItemTrash_alertCancel", comment:""),
            style:
            UIAlertActionStyle.cancel)
        
        let actionDelete:UIAlertAction = UIAlertAction(
            title:
            NSLocalizedString("MDrawProjectMenuEditBarItemTrash_alertDelete", comment:""),
            style:
            UIAlertActionStyle.destructive)
        { (action:UIAlertAction) in
            
            DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
            { [weak self, weak controller] in
                
                guard
                
                    let node:DNode = controller?.editingNode?.viewSpatial.model
                
                else
                {
                    return
                }
                
                self?.confirmDelete(node:node)
            }
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
    
    //MARK: private
    
    private func confirmDelete(node:DNode)
    {
        
    }
}
