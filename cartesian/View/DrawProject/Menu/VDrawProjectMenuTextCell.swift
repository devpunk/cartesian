import UIKit

class VDrawProjectMenuTextCell:UICollectionViewCell
{
    private weak var imageView:UIImageView!
    private weak var labelTitle:UILabel!
    private let kTitleHeight:CGFloat = 15
    private let kTitleBottom:CGFloat = -18
    private let kImageTop:CGFloat = 5
    private let kImageBottom:CGFloat = 20
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
        imageView.contentMode = UIViewContentMode.center
        imageView.isUserInteractionEnabled = false
        self.imageView = imageView
        
        let labelTitle:UILabel = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.isUserInteractionEnabled = false
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.font = UIFont.regular(size:12)
        labelTitle.textColor = UIColor.black
        self.labelTitle = labelTitle
        
        addSubview(imageView)
        addSubview(labelTitle)
        
        NSLayoutConstraint.topToTop(
            view:imageView,
            toView:self,
            constant:kImageTop)
        NSLayoutConstraint.bottomToTop(
            view:imageView,
            toView:labelTitle,
            constant:kImageBottom)
        NSLayoutConstraint.equalsHorizontal(
            view:imageView,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:labelTitle,
            toView:self,
            constant:kTitleBottom)
        NSLayoutConstraint.height(
            view:labelTitle,
            constant:kTitleHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:labelTitle,
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
    
    func config(model:MDrawProjectMenuTextItem)
    {
        imageView.image = model.image
        labelTitle.text = model.title
        hover()
    }
}
