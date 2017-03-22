import UIKit

class VDrawProjectShareImage:UIView
{
    private weak var controller:CDrawProjectShare!
    private weak var imageView:UIImageView!
    private weak var labelSize:UILabel!
    private let kImageTop:CGFloat = 40
    private let kImageMarginHorizontal:CGFloat = 20
    private let kLabelHeight:CGFloat = 50
    
    init(controller:CDrawProjectShare)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        self.controller = controller
        
        let imageView:UIImageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.center
        self.imageView = imageView
        
        let labelSize:UILabel = UILabel()
        labelSize.isUserInteractionEnabled = false
        labelSize.translatesAutoresizingMaskIntoConstraints = false
        labelSize.backgroundColor = UIColor.clear
        labelSize.textAlignment = NSTextAlignment.center
        labelSize.font = UIFont.numeric(size:16)
        labelSize.textColor = UIColor.black
        self.labelSize = labelSize
        
        addSubview(imageView)
        addSubview(labelSize)
        
        NSLayoutConstraint.topToTop(
            view:imageView,
            toView:self,
            constant:kImageTop)
        NSLayoutConstraint.equalsHorizontal(
            view:imageView,
            toView:self,
            margin:kImageMarginHorizontal)
        NSLayoutConstraint.bottomToTop(
            view:imageView,
            toView:labelSize)
        
        NSLayoutConstraint.bottomToBottom(
            view:labelSize,
            toView:self)
        NSLayoutConstraint.height(
            view:labelSize,
            constant:kLabelHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:labelSize,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: public
    
    func refresh()
    {
        guard
        
            let image:UIImage = controller.shareImage
        
        else
        {
            return
        }
        
        let imageWidth:Int = Int(image.size.width)
        let imageHeight:Int = Int(image.size.height)
        let stringSize:String = "\(imageWidth) × \(imageHeight)"
        labelSize.text = stringSize
        imageView.image = image
    }
}
