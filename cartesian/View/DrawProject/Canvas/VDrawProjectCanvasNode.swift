import UIKit

class VDrawProjectCanvasNode:UIView
{
    private weak var model:DNode?
    private let margin2:CGFloat
    private let kMargin:CGFloat = 20
    
    init(model:DNode)
    {
        self.model = model
        margin2 = kMargin + kMargin
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func draw(_ rect:CGRect)
    {
        guard
            
            let model:DNode = self.model,
            let context:CGContext = UIGraphicsGetCurrentContext()
            
        else
        {
            return
        }
        
        model.draw(context:context)
    }
    
    //MARK: public
    
    func centerNode()
    {
        guard
            
            let model:DNode = self.model
        
        else
        {
            return
        }
        
        let positionX:CGFloat = CGFloat(model.centerX) - kMargin
        let positionY:CGFloat = CGFloat(model.centerY) - kMargin
        let width:CGFloat = CGFloat(model.width) + margin2
        let height:CGFloat = CGFloat(model.height) + margin2
        frame = CGRect(
            x:positionX,
            y:positionY,
            width:width,
            height:height)
    }
}
