import UIKit

class CDrawProject:CController
{
    let modelState:MDrawProjectState
    let modelMenuState:MDrawProjectMenuState
    let modelZoom:MDrawProjectMenuZoom
    let modelColor:MDrawProjectColor
    var model:DProject?
    private var firstTime:Bool
    private(set) weak var viewProject:VDrawProject!
    private(set) weak var editingView:VDrawProjectCanvasView?
    private let kAfterPanning:TimeInterval = 1
    
    init(model:DProject?)
    {
        self.model = model
        modelState = MDrawProjectState()
        modelMenuState = MDrawProjectMenuState()
        modelZoom = MDrawProjectMenuZoom()
        modelColor = MDrawProjectColor()
        firstTime = true
        
        super.init()
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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        modelState.stateStand(controller:self)
        modelMenuState.stateHidden(
            controller:self)
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        parentController.hideBar(barHidden:true)
        
        viewProject.viewDidAppeared()
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            guard
            
                let strongSelf:CDrawProject = self
            
            else
            {
                return
            }
            
            if strongSelf.firstTime
            {
                strongSelf.firstTime = false
                
                if strongSelf.model == nil
                {
                    strongSelf.createProject()
                }
                else
                {
                    strongSelf.modelLoaded()
                }
            }
        }
        
        DispatchQueue.main.asyncAfter(
            deadline:DispatchTime.now() + kAfterPanning)
        { [weak self] in
            
            self?.parentController.viewParent.panRecognizer.isEnabled = false
        }
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
            
            guard
                
                let project:DProject = data as? DProject
            
            else
            {
                return
            }
            
            project.defaultValues()
            self?.model = project
            
            DManager.sharedInstance?.save()
            
            self?.modelLoaded()
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
    
    private func modelLoaded()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.viewProject.refresh()
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
                let color:UIColor = self?.modelColor.selectedColor()
            
            else
            {
                return
            }
            
            node.centerAt(center:centerPoint)
            node.project = self?.model
            node.colorWithColor(color:color)
            node.defaultValues()
            DManager.sharedInstance?.save()
            
            self?.reDraw()
        }
    }
    
    func linkNode(destination:DNode)
    {
        guard
        
            let origin:DNode = editingView?.viewSpatial.model as? DNode
        
        else
        {
            return
        }
        
        DManager.sharedInstance?.createData(
            entityName:DLink.entityName)
        { (data) in
            
            guard
            
                let linkModel:DLink = data as? DLink
            
            else
            {
                return
            }
            
            linkModel.project = origin.project
            linkModel.origin = origin
            linkModel.destination = destination
            linkModel.defaultValues()
            DManager.sharedInstance?.save()
            
            DispatchQueue.main.async
            { [weak self] in
                
                self?.reDraw()
                self?.stopLinking()
            }
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
    
    func editNode(editingView:VDrawProjectCanvasNode)
    {
        if editingView != self.editingView
        {
            self.editingView?.stopEditing()
            self.editingView = editingView
            editingView.startEditing()
            
            viewProject.viewScroll.centerOn(
                point:editingView.center)
            
            guard
                
                let nodeModel:DNode = editingView.viewSpatial.model as? DNode
                
            else
            {
                return
            }
            
            modelState.stateEditing(controller:self)
            viewProject.viewMenu.displayNode(model:nodeModel)
            modelMenuState.current?.show()
        }
    }
    
    func editLabel(editingView:VDrawProjectCanvasLabel)
    {
        if editingView != self.editingView
        {
            self.editingView?.stopEditing()
            self.editingView = editingView
            editingView.startEditing()
            
            viewProject.viewScroll.centerTopOn(
                point:editingView.center)
            
            guard
            
                let labelModel:DLabel = editingView.viewSpatial.model as? DLabel
            
            else
            {
                return
            }
            
            viewProject.viewMenu.displayText(model:labelModel)
            modelMenuState.current?.half()
        }
    }
    
    func editLink(editingView:VDrawProjectCanvasLink)
    {
        if editingView != self.editingView
        {
            self.editingView?.stopEditing()
            self.editingView = editingView
            editingView.startEditing()
            
            viewProject.viewScroll.centerOn(
                point:editingView.center)
            
            modelState.stateEditing(controller:self)
            modelMenuState.current?.hide()
            viewProject.viewMenu.viewBar.modeLinkEdit()
        }
    }
    
    func trashEditing()
    {
        editingView?.stopEditing()
        
        guard
            
            let drawable:DDrawable = editingView?.viewSpatial.model
        
        else
        {
            return
        }
        
        DManager.sharedInstance?.delete(data:drawable)
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
    
    func stopEdition()
    {
        editingView?.stopEditing()
        editingView = nil
        
        modelState.stateStand(controller:self)
        viewProject.viewMenu.viewBar.modeNormal()
    }
    
    func startMoving()
    {
        editingView?.stopEditing()
        editingView = nil
        
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
        editingView?.stopEditing()
        editingView = nil
        modelState.stateStand(controller:self)
        modelMenuState.current?.show()
        viewProject.viewMenu.viewBar.modeNormal()
    }
    
    func startLinking()
    {
        guard
            
            let _:VDrawProjectCanvasNode = editingView as? VDrawProjectCanvasNode
        
        else
        {
            return
        }
        
        modelState.stateLinking(controller:self)
        modelMenuState.current?.hide()
        viewProject.viewMenu.viewBar.modeLink()
    }
    
    func stopLinking()
    {
        editingView?.stopEditing()
        editingView = nil
        
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
    
    func share()
    {
        modelMenuState.current?.hide()
        
        guard
        
            let model:DProject = self.model
        
        else
        {
            return
        }
        
        let controllerShare:CDrawProjectShare = CDrawProjectShare(model:model)
        parentController.animateOver(controller:controllerShare)
    }
    
    func openStore()
    {
        let controllerStore:CStore = CStore()
        parentController.push(
            controller:controllerStore,
            horizontal:CParent.TransitionHorizontal.fromRight)
        { [weak self] in
            
            self?.viewProject.viewStore?.animateClose()
        }
    }
}
