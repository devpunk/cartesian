import UIKit

class VSettingsHeader:UICollectionReusableView
{
    private let kLabelHeight:CGFloat = 30
    private let kLabelBottom:CGFloat = -20
    private let kVersionKey:String = "CFBundleShortVersionString"
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        isUserInteractionEnabled = false
        
        let imageView:UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.center
        imageView.isUserInteractionEnabled = false
        imageView.image = #imageLiteral(resourceName: "assetGenericLogo")
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.font = UIFont.numeric(size:16)
        label.textAlignment = NSTextAlignment.center
        
        addSubview(imageView)
        addSubview(label)
        
        NSLayoutConstraint.equals(
            view:imageView,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:label,
            toView:self,
            constant:kLabelBottom)
        NSLayoutConstraint.height(
            view:label,
            constant:kLabelHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:label,
            toView:self)
        
        guard
            
            let bundleDictionary:[String:Any] = Bundle.main.infoDictionary
            
        else
        {
            return
        }
        
        let versionString:String? = bundleDictionary[kVersionKey] as? String
        label.text = versionString
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
