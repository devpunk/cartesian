import UIKit

class VDrawProjectFontCell:UICollectionViewCell
{
    private weak var controller:CDrawProject?
    private weak var model:MDrawProjectMenuLabelsFontItem?
    private weak var label:UILabel!
    private weak var button:UIButton!
    private weak var collectionView:VCollection!
    private let kBorderHeight:CGFloat = 1
    private let kLabelMargin:CGFloat = 10
    private let kLabelHeight:CGFloat = 18
    private let kButtonWidth:CGFloat = 90
    private let kButtonHeight:CGFloat = 32
    private let kCornerRadius:CGFloat = 5
    private let kAlphaSelected:CGFloat = 1
    private let kAlphaNotSelected:CGFloat = 0.5
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        
        let border:VBorder = VBorder(color:UIColor(white:0, alpha:0.1))
        
        let label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        label.backgroundColor = UIColor.clear
        label.font = UIFont.bold(size:15)
        label.textColor = UIColor.black
        self.label = label
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.backgroundColor = UIColor.cartesianBlue
        button.layer.cornerRadius = kCornerRadius
        button.setTitleColor(
            UIColor.white,
            for:UIControlState.normal)
        button.setTitleColor(
            UIColor(white:1, alpha:0.2),
            for:UIControlState.highlighted)
        button.setTitle(
            NSLocalizedString("VDrawProjectFontCell_button", comment:""),
            for:UIControlState.normal)
        button.titleLabel!.font = UIFont.bold(size:13)
        self.button = button
        
        addSubview(border)
        addSubview(label)
        addSubview(button)
        
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
        
        NSLayoutConstraint.topToTop(
            view:button,
            toView:self,
            constant:kLabelMargin)
        NSLayoutConstraint.height(
            view:button,
            constant:kButtonHeight)
        NSLayoutConstraint.rightToRight(
            view:button,
            toView:self,
            constant:-kLabelMargin)
        NSLayoutConstraint.width(
            view:button,
            constant:kButtonWidth)
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
            backgroundColor = UIColor.clear
            button.alpha = 1
        }
        else
        {
            alpha = kAlphaNotSelected
            backgroundColor = UIColor(white:0.93, alpha:1)
            button.alpha = 0
        }
    }
    
    //MARK: public
    
    func config(controller:CDrawProject, model:MDrawProjectMenuLabelsFontItem)
    {
        self.controller = controller
        self.model = model
        label.text = model.name
        
        hover()
    }
}
