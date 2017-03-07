import UIKit

class VDrawProjectColorCell:UICollectionViewCell
{
    private weak var innerColor:UIView!
    private let kAlphaSelected:CGFloat = 0.2
    private let kAlphaNotSelected:CGFloat = 1
    private let kMargin:CGFloat = 1
    private let kCornerRadius:CGFloat = 2
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let outerColor:UIView = UIView()
        outerColor.clipsToBounds = true
        outerColor.translatesAutoresizingMaskIntoConstraints = false
        outerColor.isUserInteractionEnabled = false
        outerColor.backgroundColor = UIColor.black
        outerColor.layer.cornerRadius = kCornerRadius
        
        let middleColor:UIView = UIView()
        middleColor.clipsToBounds = true
        middleColor.translatesAutoresizingMaskIntoConstraints = false
        middleColor.isUserInteractionEnabled = false
        middleColor.backgroundColor = UIColor.white
        middleColor.layer.cornerRadius = kCornerRadius
        
        let innerColor:UIView = UIView()
        innerColor.clipsToBounds = true
        innerColor.translatesAutoresizingMaskIntoConstraints = false
        innerColor.isUserInteractionEnabled = false
        innerColor.backgroundColor = UIColor.clear
        innerColor.layer.cornerRadius = kCornerRadius
        self.innerColor = innerColor
        
        addSubview(outerColor)
        addSubview(middleColor)
        addSubview(innerColor)
        
        NSLayoutConstraint.equals(
            view:outerColor,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:middleColor,
            toView:outerColor,
            margin:kMargin)
        
        NSLayoutConstraint.equals(
            view:innerColor,
            toView:middleColor,
            margin:kMargin)
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
    
    func config(model:MDrawProjectColorItem)
    {
        innerColor.backgroundColor = model.color
        hover()
    }
}
