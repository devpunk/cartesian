import UIKit

class VDrawProjectFontCell:UICollectionViewCell
{
    private weak var controller:CDrawProject?
    private weak var model:MDrawProjectMenuLabelsFontItem?
    private weak var label:UILabel!
    private weak var collectionView:VCollection!
    private let kBorderHeight:CGFloat = 1
    private let kLabelMargin:CGFloat = 10
    private let kLabelHeight:CGFloat = 22
    private let kAlphaSelected:CGFloat = 0.4
    private let kAlphaNotSelected:CGFloat = 1
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let border:VBorder = VBorder(color:UIColor(white:0, alpha:0.1))
        
        let label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        label.backgroundColor = UIColor.clear
        label.font = UIFont.bold(size:17)
        label.textColor = UIColor.black
        self.label = label
        
        addSubview(border)
        addSubview(label)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:label,
            toView:self,
            constant:kLabelMargin)
        NSLayoutConstraint.height(
            view:label,
            constant:kLabelHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:label,
            toView:self,
            margin:kLabelMargin)
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
    
    func config(controller:CDrawProject, model:MDrawProjectMenuLabelsFontItem)
    {
        self.controller = controller
        self.model = model
        label.text = model.name
    }
}
