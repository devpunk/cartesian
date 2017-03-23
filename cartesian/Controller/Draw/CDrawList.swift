import UIKit

class CDrawList:CController
{
    let model:MDrawList
    private weak var viewList:VDrawList!
    
    override init()
    {
        model = MDrawList()
        super.init()
        
        model.controller = self
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func loadView()
    {
        let viewList:VDrawList = VDrawList(controller:self)
        self.viewList = viewList
        view = viewList
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        
        model.update()
    }
    
    //MARK: private
    
    private func confirmDelete(project:DProject)
    {
        DManager.sharedInstance?.delete(data:project)
        { [weak self] in
            
            DManager.sharedInstance?.save()
            
            self?.model.update()
        }
    }
    
    //MARK: public

    func listLoaded()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.viewList.refresh()
        }
    }
    
    func newDraw()
    {
        let controllerProject:CDrawProject = CDrawProject(model:nil)
        parentController.push(
            controller:controllerProject,
            horizontal:CParent.TransitionHorizontal.fromRight)
    }
    
    func openDraw(project:DProject)
    {
        let controllerProject:CDrawProject = CDrawProject(model:project)
        parentController.push(
            controller:controllerProject,
            horizontal:CParent.TransitionHorizontal.fromRight)
    }
    
    func trashDraw(project:DProject)
    {
        UIApplication.shared.keyWindow!.endEditing(true)
        
        let alert:UIAlertController = UIAlertController(
            title:NSLocalizedString("CDrawList_alertTitle", comment:""),
            message:nil,
            preferredStyle:UIAlertControllerStyle.actionSheet)
        
        let actionCancel:UIAlertAction = UIAlertAction(
            title:
            NSLocalizedString("CDrawList_alertCancel", comment:""),
            style:
            UIAlertActionStyle.cancel)
        
        let actionDelete:UIAlertAction = UIAlertAction(
            title:
            NSLocalizedString("CDrawList_alertDelete", comment:""),
            style:
            UIAlertActionStyle.destructive)
        { (action:UIAlertAction) in
            
            DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
            { [weak self, weak project] in
                
                guard
                
                    let strongProject:DProject = project
                
                else
                {
                    return
                }
                
                self?.confirmDelete(project:strongProject)
            }
        }
        
        alert.addAction(actionDelete)
        alert.addAction(actionCancel)
        
        if let popover:UIPopoverPresentationController = alert.popoverPresentationController
        {
            popover.sourceView = viewList
            popover.sourceRect = CGRect.zero
            popover.permittedArrowDirections = UIPopoverArrowDirection.up
        }
        
        present(alert, animated:true, completion:nil)
    }
    
    func shareProject(project:DProject)
    {
        let controllerShare:CDrawProjectShare = CDrawProjectShare(
            model:project)
        parentController.animateOver(controller:controllerShare)
    }
}
