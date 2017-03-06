import UIKit

class CDrawList:CController
{
    private weak var viewList:VDrawList!
    
    override func loadView()
    {
        let viewList:VDrawList = VDrawList(controller:self)
        self.viewList = viewList
        view = viewList
    }
    
    //MARK: public
    
    func newDraw()
    {
        let controllerProject:CDrawProject = CDrawProject(model:nil)
        parentController.push(
            controller:controllerProject,
            horizontal:CParent.TransitionHorizontal.fromRight)
    }
}
