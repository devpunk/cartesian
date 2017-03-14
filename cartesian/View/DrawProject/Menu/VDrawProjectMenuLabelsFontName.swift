import UIKit

class VDrawProjectMenuLabelsFontName:UIButton
{
    private weak var controller:CDrawProject!
    private let kTitleBaseWidth:CGFloat = 60
    private let kAlphaSelected:CGFloat = 0.2
    private let kAlphaNotSelected:CGFloat = 1
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(
            self,
            action:#selector(actionButton(sender:)),
            for:UIControlEvents.touchUpInside)
        self.controller = controller
        
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
        
        titleBase.addSubview(labelTitle)
        addSubview(titleBase)
        
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
}
