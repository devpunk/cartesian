import UIKit

class CDrawProject:CController
{
    let modelZoom:MDrawProjectMenuZoom
    let modelColor:MDrawProjectColor
    var model:DProject?
    private(set) weak var viewProject:VDrawProject!
    private weak var editingNode:VDrawProjectCanvasNode?
    private let kInitialSize:Float = 100
    
    init(model:DProject?)
    {
        self.model = model
        modelZoom = MDrawProjectMenuZoom()
        modelColor = MDrawProjectColor()
        
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
    
    private func reDraw()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.viewProject.viewScroll.viewCanvas.draw()
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
            
                let node:DNode = data as? DNode,
                let initialSize:Float = self?.kInitialSize,
                let color:UIColor = self?.modelColor.selectedColor()
            
            else
            {
                return
            }
            
            node.centerAt(center:centerPoint)
            node.project = self?.model
            node.width = initialSize
            node.height = initialSize
            node.colorWithColor(color:color)
            
            self?.reDraw()
        }
    }
    
    func editNode(editingNode:VDrawProjectCanvasNode)
    {
        if editingNode != self.editingNode
        {
            self.editingNode?.endEffect()
            editingNode.startEffect()
            self.editingNode = editingNode
            
            viewProject.viewScroll.centerOn(
                point:editingNode.center)
            
            guard
                
                let nodeModel:DNode = editingNode.model
                
            else
            {
                return
            }
            
            viewProject.viewMenu.displayNode(model:nodeModel)
        }
    }
    
    func stopEdition()
    {
        editingNode?.endEffect()
        editingNode = nil
        
        viewProject.viewMenu.viewBar.modeNormal()
    }
}
