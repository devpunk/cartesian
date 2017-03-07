import UIKit

class VDrawProjectCanvasNodeEffect:UIView
{
    private var model:MDrawProjectCanvasEffect?
    private let image:UIImage
    private let imageWidth:CGFloat
    private let imageHeight:CGFloat
    
    init(model:DNode)
    {
        image = #imageLiteral(resourceName: "assetNodeEffectStar")
        imageWidth = image.size.width
        imageHeight = image.size.height
        
        super.init(frame:CGRect.zero)
        isHidden = true
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        
        let viewMask:VDrawProjectCanvasNodeSpatial = VDrawProjectCanvasNodeSpatial(
            model:model)
        mask = viewMask
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        mask?.frame = bounds
        
        super.layoutSubviews()
    }
    
    override func draw(_ rect:CGRect)
    {
        guard
        
            let _:CGContext = UIGraphicsGetCurrentContext(),
            let model:MDrawProjectCanvasEffect = self.model
        
        else
        {
            return
        }
        
        for item:MDrawProjectCanvasEffectItem in model.items
        {
            item.step()
            
            let rect:CGRect = CGRect(
                x:item.positionX,
                y:item.positionY,
                width:imageWidth,
                height:imageHeight)
            
            image.draw(in:rect)
        }
    }
    
    //MARK: public
    
    func start()
    {
        setNeedsDisplay()
        
        let width:CGFloat = bounds.size.width
        let height:CGFloat = bounds.size.height
        model = MDrawProjectCanvasEffect(width:width, height:height)
        isHidden = false
    }
    
    func end()
    {
        model = nil
        isHidden = true
    }
    
    func tick()
    {
        setNeedsDisplay()
    }
}
