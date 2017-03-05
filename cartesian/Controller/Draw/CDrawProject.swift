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
}
