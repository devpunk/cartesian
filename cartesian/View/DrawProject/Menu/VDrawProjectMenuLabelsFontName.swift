import UIKit

class VDrawProjectMenuLabelsFontName:UIButton
{
    let model:MDrawProjectMenuLabelsFont
    private weak var controller:CDrawProject!
    private weak var labelFont:UILabel!
    private let kTitleBaseWidth:CGFloat = 62
    private let kFontLeft:CGFloat = 10
    private let kBorderHeight:CGFloat = 1
    private let kAlphaSelected:CGFloat = 0.2
    private let kAlphaNotSelected:CGFloat = 1
    
    init(controller:CDrawProject)
    {
        model = MDrawProjectMenuLabelsFont()
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(
            self,
            action:#selector(actionButton(sender:)),
            for:UIControlEvents.touchUpInside)
        self.controller = controller
        
        let border:VBorder = VBorder(color:UIColor.cartesianBlue)
        
        let titleBase:UIView = UIView()
        titleBase.isUserInteractionEnabled = false
        titleBase.translatesAutoresizingMaskIntoConstraints = false
        titleBase.backgroundColor = UIColor.cartesianBlue
        
        let labelTitle:UILabel = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.isUserInteractionEnabled = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.font = UIFont.bold(size:15)
        labelTitle.textColor = UIColor.white
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.text = NSLocalizedString("VDrawProjectMenuLabelsFontName_labelTitle", comment:"")
        
        let labelFont:UILabel = UILabel()
        labelFont.translatesAutoresizingMaskIntoConstraints = false
        labelFont.isUserInteractionEnabled = false
        labelFont.backgroundColor = UIColor.clear
        labelFont.textColor = UIColor.black
        self.labelFont = labelFont
        
        titleBase.addSubview(labelTitle)
        addSubview(border)
        addSubview(titleBase)
        addSubview(labelFont)
        
        NSLayoutConstraint.equalsVertical(
            view:titleBase,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:titleBase,
            toView:self)
        NSLayoutConstraint.width(
            view:titleBase,
            constant:kTitleBaseWidth)
        
        NSLayoutConstraint.equals(
            view:labelTitle,
            toView:titleBase)
        
        NSLayoutConstraint.equalsVertical(
            view:labelFont,
            toView:self)
        NSLayoutConstraint.leftToRight(
            view:labelFont,
            toView:titleBase,
            constant:kFontLeft)
        NSLayoutConstraint.rightToRight(
            view:labelFont,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        updateFont()
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
    
    //MARK: actions
    
    func actionButton(sender button:UIButton)
    {
        
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
    
    private func updateFont()
    {
        if let font:MDrawProjectMenuLabelsFontItem = model.currentFont
        {
            if let currentType:String = font.currentType
            {
                labelFont.font = UIFont(name:currentType, size:13)
                labelFont.text = font.displayName()
            }
        }
    }
}
