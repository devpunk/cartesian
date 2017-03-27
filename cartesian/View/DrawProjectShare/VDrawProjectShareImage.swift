import UIKit

class VDrawProjectShareImage:UIView
{
    private weak var controller:CDrawProjectShare!
    private weak var imageView:UIImageView!
    private weak var labelSize:UILabel!
    private let kLabelHeight:CGFloat = 60
    private let kDefaultResolution:CGFloat = 1
    private let kBorderHeight:CGFloat = 1
    
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
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        imageView.backgroundColor = UIColor.white
        self.imageView = imageView
        
        let labelSize:UILabel = UILabel()
        labelSize.isUserInteractionEnabled = false
        labelSize.translatesAutoresizingMaskIntoConstraints = false
        labelSize.backgroundColor = UIColor.clear
        labelSize.textAlignment = NSTextAlignment.center
        labelSize.font = UIFont.numeric(size:16)
        labelSize.textColor = UIColor.black
        self.labelSize = labelSize
        
        let border:VBorder = VBorder(color:UIColor(white:0, alpha:0.2))
        
        addSubview(border)
        addSubview(imageView)
        addSubview(labelSize)
        
        NSLayoutConstraint.topToTop(
            view:imageView,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:imageView,
            toView:self)
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
        
        NSLayoutConstraint.topToBottom(
            view:border,
            toView:imageView)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
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
        
        let resolution:CGFloat
        
        if let retina:Bool = MSession.sharedInstance.settings?.retina
        {
            if retina
            {
                resolution = UIScreen.main.scale
            }
            else
            {
                resolution = kDefaultResolution
            }
        }
        else
        {
            resolution = kDefaultResolution
        }
        
        let imageWidth:Int = Int(image.size.width * resolution)
        let imageHeight:Int = Int(image.size.height * resolution)
        let stringSize:String = "\(imageWidth) × \(imageHeight) px"
        labelSize.text = stringSize
        imageView.image = image
    }
}
