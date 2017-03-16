import UIKit

class VDrawProjectFontCell:UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private weak var controller:CDrawProject?
    private weak var model:MDrawProjectMenuLabelsFontItem?
    private weak var label:UILabel!
    private weak var collectionView:VCollection!
    private let kBorderHeight:CGFloat = 1
    private let kLabelMargin:CGFloat = 10
    private let kLabelHeight:CGFloat = 24
    private let kFontSize:CGFloat = 20
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
            backgroundColor = UIColor.clear
        }
        else
        {
            alpha = kAlphaNotSelected
            backgroundColor = UIColor(white:0.93, alpha:1)
        }
    }
    
    //MARK: public
    
    func config(controller:CDrawProject, model:MDrawProjectMenuLabelsFontItem)
    {
        self.controller = controller
        self.model = model
        label.text = model.name
        label.font = UIFont.systemFont(ofSize:kFontSize)
    
        if let currentType:String = model.currentType
        {
            if let font:UIFont = UIFont(name:currentType, size:kFontSize)
            {
                label.font = font
            }
        }
        
        hover()
    }
    
    //MARK: collectionView delegate
    
    
}
