import UIKit

class VGalleryHeader:UICollectionReusableView
{
    private let kBorderHeight:CGFloat = 1
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        isUserInteractionEnabled = false
        backgroundColor = UIColor.clear
        
        let border:VBorder = VBorder(color:UIColor(white:0, alpha:0.2))
        
        addSubview(border)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
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
    
    func config(model:MGalleryItem)
    {
    }
}
