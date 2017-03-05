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
        
    }
}
