import UIKit

class MDrawProjectStateItemStand:MDrawProjectStateItem
{
    override func touchBegan(touch:UITouch, node:VDrawProjectCanvasNode)
    {
        controller.editNode(editingNode:node)
    }
}
