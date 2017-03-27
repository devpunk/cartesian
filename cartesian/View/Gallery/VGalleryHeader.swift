import UIKit

class VGalleryHeader:UICollectionReusableView
{
    private weak var labelDate:UILabel!
    private weak var labelLikes:UILabel!
    private let dateFormatter:DateFormatter
    private let kLabelMargin:CGFloat = 10
    private let kBorderHeight:CGFloat = 1
    
    override init(frame:CGRect)
    {
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.long
        
        super.init(frame:frame)
        clipsToBounds = true
        isUserInteractionEnabled = false
        backgroundColor = UIColor.clear
        
        let border:VBorder = VBorder(color:UIColor(white:0, alpha:0.1))
        
        let labelDate:UILabel = UILabel()
        labelDate.isUserInteractionEnabled = false
        labelDate.translatesAutoresizingMaskIntoConstraints = false
        labelDate.backgroundColor = UIColor.clear
        labelDate.font = UIFont.regular(size:12)
        labelDate.textColor = UIColor.black
        self.labelDate = labelDate
        
        let labelLikes:UILabel = UILabel()
        labelLikes.isUserInteractionEnabled = false
        labelLikes.translatesAutoresizingMaskIntoConstraints = false
        labelLikes.backgroundColor = UIColor.clear
        labelLikes.font = UIFont.bold(size:12)
        labelLikes.textColor = UIColor.black
        labelLikes.textAlignment = NSTextAlignment.right
        self.labelLikes = labelLikes
        
        addSubview(border)
        addSubview(labelDate)
        addSubview(labelLikes)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.equalsVertical(
            view:labelDate,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:labelDate,
            toView:self,
            constant:kLabelMargin)
        NSLayoutConstraint.rightToRight(
            view:labelDate,
            toView:self)
        
        NSLayoutConstraint.equalsVertical(
            view:labelLikes,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:labelLikes,
            toView:self,
            constant:-kLabelMargin)
        NSLayoutConstraint.leftToLeft(
            view:labelLikes,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: public
    
    func config(model:MGalleryItem)
    {
        let date:Date = Date(timeIntervalSince1970:model.lastUpdated)
        let dateString:String = dateFormatter.string(from:date)
        let likes:NSNumber = model.likes as NSNumber
        let likeString:String = String(
            format:NSLocalizedString("VGalleryHeader_labelLikes", comment:""),
            likes)
        
        labelDate.text = dateString
        labelLikes.text = likeString
    }
}
