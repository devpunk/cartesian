import UIKit

class VDrawListCell:UICollectionViewCell
{
    private weak var label:UILabel!
    private weak var imageView:UIImageView!
    private let kCornerRadius:CGFloat = 5
    private let kImageSize:CGFloat = 70
    private let kContentTop:CGFloat = 10
    private let kContentLeft:CGFloat = 10
    private let kBorderWidth:CGFloat = 1
    private let kAlphaSelected:CGFloat = 0.15
    private let kAlphaNotSelected:CGFloat = 1
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let imageView:UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.isUserInteractionEnabled = false
        imageView.layer.cornerRadius = kCornerRadius
        imageView.layer.borderColor = UIColor(white:0, alpha:0.1).cgColor
        imageView.layer.borderWidth = kBorderWidth
        self.imageView = imageView
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.font = UIFont.regular(size:14)
        label.textColor = UIColor.black
        self.label = label
        
        addSubview(label)
        addSubview(imageView)
        
        NSLayoutConstraint.topToTop(
            view:imageView,
            toView:self,
            constant:kContentTop)
        NSLayoutConstraint.leftToLeft(
            view:imageView,
            toView:self,
            constant:kContentLeft)
        NSLayoutConstraint.size(
            view:imageView,
            constant:kImageSize)
        
        NSLayoutConstraint.topToTop(
            view:label,
            toView:self,
            constant:kContentTop)
        NSLayoutConstraint.height(
            view:label,
            constant:kImageSize)
        NSLayoutConstraint.leftToRight(
            view:label,
            toView:imageView,
            constant:kContentLeft)
        NSLayoutConstraint.rightToRight(
            view:label,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override var isSelected:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    override var isHighlighted:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    //MARK: private
    
    private func hover()
    {
        if isSelected || isHighlighted
        {
            alpha = kAlphaSelected
        }
        else
        {
            alpha = kAlphaNotSelected
        }
    }
    
    //MARK: public
    
    func config(model:MDrawListItem)
    {
        label.text = model.project.projectName()
    }
}
