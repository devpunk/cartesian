import UIKit

class CDrawProject:CController
{
    let modelZoom:MDrawProjectMenuZoom
    var model:DProject?
    private(set) weak var viewProject:VDrawProject!
    
    init(model:DProject?)
    {
        self.model = model
        modelZoom = MDrawProjectMenuZoom()
        
        super.init()
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            if self?.model == nil
            {
                self?.createProject()
            }
        }
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
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
        
        viewProject.viewDidAppeared()
    }
    
    override func viewDidDisappear(_ animated:Bool)
    {
        super.viewDidDisappear(animated)
        
        parentController.hideBar(barHidden:false)
    }
    
    //MARK: private
    
    private func createProject()
    {
        DManager.sharedInstance?.createData(
            entityName:DProject.entityName)
        { [weak self] (data) in
            
            self?.model = data as? DProject
        }
    }
    
    //MARK: public
    
    func back()
    {
        parentController.pop(horizontal:CParent.TransitionHorizontal.fromRight)
    }
    
    func addNode(entityName:String)
    {
        let centerPoint:CGPoint = viewProject.viewScroll.centerPoint()
        
        DManager.sharedInstance?.createData(
            entityName:entityName)
        { [weak self] (data) in
            
            guard
            
                let node:DNode = data as? DNode
            
            else
            {
                return
            }
            
            node.centerX = Float()
        }
    }
}
