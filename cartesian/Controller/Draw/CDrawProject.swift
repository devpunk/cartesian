import UIKit

class CDrawProject:CController
{
    private weak var viewProject:VDrawProject!
    
    override func loadView()
    {
        let viewProject:VDrawProject = VDrawProject(controller:self)
        self.viewProject = viewProject
        view = viewProject
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        
        parentController.hideBar(barHidden:true)
        parentController.viewParent.panRecognizer.isEnabled = false
    }
    
    override func viewDidDisappear(_ animated:Bool)
    {
        super.viewDidDisappear(animated)
        
        parentController.hideBar(barHidden:false)
    }
}
