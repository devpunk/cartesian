import UIKit

class VDrawProjectCanvasNodeEffect:UIView
{
    private let image:UIImage
    private let imageWidth:CGFloat
    private let imageHeight:CGFloat
    
    init()
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
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func draw(_ rect:CGRect)
    {
        image.draw(in:CGRect(x:0, y:0, width:imageWidth, height:imageHeight))
    }
    
    //MARK: public
    
    func start()
    {
        
    }
    
    func end()
    {
        
    }
}
