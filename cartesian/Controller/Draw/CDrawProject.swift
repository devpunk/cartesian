import UIKit

class CDrawProject:CController
{
    let modelState:MDrawProjectState
    let modelMenuState:MDrawProjectMenuState
    let modelZoom:MDrawProjectMenuZoom
    let modelColor:MDrawProjectColor
    var model:DProject?
    private(set) weak var viewProject:VDrawProject!
    private(set) weak var editingNode:VDrawProjectCanvasNode?
    private(set) weak var editingLabel:VDrawProjectCanvasLabel?
    private let kInitialSize:Float = 100
    
    init(model:DProject?)
    {
        self.model = model
        modelState = MDrawProjectState()
        modelMenuState = MDrawProjectMenuState()
        modelZoom = MDrawProjectMenuZoom()
        modelColor = MDrawProjectColor()
        
        super.init()
        
        modelState.stateStand(controller:self)
        modelMenuState.stateHidden(
            controller:self)
        
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
            
            DManager.sharedInstance?.save()
        }
    }
    
    private func standNormalAndDraw()
    {
        modelState.stateStand(controller:self)
        viewProject.viewMenu.viewBar.modeNormal()
        reDraw()
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
            DManager.sharedInstance?.save()
            
            self?.reDraw()
        }
    }
    
    func addLabel(
        text:String,
        fontName:String,
        fontSize:Int16,
        color:UIColor)
    {
        let centerPoint:CGPoint = viewProject.viewScroll.centerPoint()
        
        DManager.sharedInstance?.createData(
            entityName:DLabel.entityName)
        { [weak self] (data) in
            
            guard
                
                let label:DLabel = data as? DLabel
            
            else
            {
                return
            }
            
            label.centerAt(center:centerPoint)
            label.project = self?.model
            label.fontName = fontName
            label.fontSize = fontSize
            label.colorWithColor(color:color)
            label.generate(text:text)
            
            DManager.sharedInstance?.save()
            
            self?.reDraw()
        }
    }
    
    func editNode(editingNode:VDrawProjectCanvasNode)
    {
        if editingNode != self.editingNode
        {
            editingLabel?.stopEditing()
            editingLabel = nil
            
            self.editingNode?.endEffect()
            editingNode.startEffect()
            self.editingNode = editingNode
            
            viewProject.viewScroll.centerOn(
                point:editingNode.center)
            
            guard
                
                let nodeModel:DNode = editingNode.viewSpatial.model
                
            else
            {
                return
            }
            
            modelState.stateEditing(controller:self)
            viewProject.viewMenu.displayNode(model:nodeModel)
            modelMenuState.current?.show()
        }
    }
    
    func editLabel(editingLabel:VDrawProjectCanvasLabel)
    {
        if editingLabel != self.editingLabel
        {
            editingNode?.endEffect()
            editingNode = nil
            
            self.editingLabel?.stopEditing()
            self.editingLabel = editingLabel
            editingLabel.startEditing()
            viewProject.viewScroll.centerOn(
                point:editingLabel.center)
            
            guard
            
                let labelModel:DLabel = editingLabel.viewSpatial.model
            
            else
            {
                return
            }
            
            modelState.stateEditing(controller:self)
            viewProject.viewMenu.displayText(model:labelModel)
            modelMenuState.current?.show()
        }
    }
    
    func trashEditingNode()
    {
        guard
            
            let editingNode:VDrawProjectCanvasNode = self.editingNode
            
        else
        {
            return
        }
        
        editingNode.endEffect()
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            guard
            
                let nodeModel:DNode = self?.editingNode?.viewSpatial.model
            
            else
            {
                return
            }
            
            DManager.sharedInstance?.delete(data:nodeModel)
            {
                DManager.sharedInstance?.save
                {
                    DispatchQueue.main.async
                    { [weak self] in
                        
                        self?.standNormalAndDraw()
                    }
                }
            }
        }
    }
    
    func stopEdition()
    {
        editingNode?.endEffect()
        editingLabel?.stopEditing()
        editingNode = nil
        editingLabel = nil
        
        modelState.stateStand(controller:self)
        viewProject.viewMenu.viewBar.modeNormal()
    }
    
    func startMoving()
    {
        editingNode?.endEffect()
        editingNode = nil
        
        modelState.stateMoving(controller:self)
        modelMenuState.current?.hide()
        viewProject.viewMenu.viewBar.modeMove()
    }
    
    func endMoving()
    {
        modelState.stateStand(controller:self)
        modelMenuState.current?.show()
        viewProject.viewMenu.viewBar.modeNormal()
    }
    
    func startText(delegate:UITextFieldDelegate)
    {
        modelState.stateText(controller:self)
        modelMenuState.current?.hide()
        viewProject.viewMenu.viewBar.modeText(delegate:delegate)
    }
    
    func endText()
    {
        modelState.stateStand(controller:self)
        modelMenuState.current?.show()
        viewProject.viewMenu.viewBar.modeNormal()
    }
    
    func increaseZoom()
    {
        modelZoom.increase()
        viewProject.refresh()
    }
    
    func decreaseZoom()
    {
        modelZoom.decrease()
        viewProject.refresh()
    }
}
