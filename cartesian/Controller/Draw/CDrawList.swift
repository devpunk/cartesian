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
}
