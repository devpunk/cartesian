import UIKit

class VDrawProjectMenuSettingsDefaultColor:UIButton, MDrawProjectColorDelegate
{
    private weak var controller:CDrawProject!
    private weak var viewInner:UIView!
    private let kMarginOuter:CGFloat = 1
    private let kLabelRight:CGFloat = -6
    private let kLabelHeight:CGFloat = 56
    private let kOuterTop:CGFloat = 18
    private let kOuterRight:CGFloat = -10
    private let kOuterSize:CGFloat = 20
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
            action:#selector(actionColors(sender:)),
            for:UIControlEvents.touchUpInside)
        self.controller = controller
        
        let viewOuter:UIView = UIView()
        viewOuter.backgroundColor = UIColor.black
        viewOuter.isUserInteractionEnabled = false
        viewOuter.translatesAutoresizingMaskIntoConstraints = false
        viewOuter.clipsToBounds = true
        
        let viewMiddle:UIView = UIView()
        viewMiddle.backgroundColor = UIColor.white
        viewMiddle.isUserInteractionEnabled = false
        viewMiddle.translatesAutoresizingMaskIntoConstraints = false
        viewMiddle.clipsToBounds = true
        
        let viewInner:UIView = UIView()
        viewInner.isUserInteractionEnabled = false
        viewInner.translatesAutoresizingMaskIntoConstraints = false
        viewInner.clipsToBounds = true
        viewInner.backgroundColor = controller.modelColor.selectedColor()
        self.viewInner = viewInner
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.right
        label.font = UIFont.bold(size:14)
        label.textColor = UIColor(white:0.6, alpha:1)
        label.text = NSLocalizedString("VDrawProjectMenuSettingsDefaultColor_label", comment:"")
        
        addSubview(viewOuter)
        addSubview(viewMiddle)
        addSubview(viewInner)
        addSubview(label)
        
        NSLayoutConstraint.topToTop(
            view:viewOuter,
            toView:self,
            constant:kOuterTop)
        NSLayoutConstraint.rightToRight(
            view:viewOuter,
            toView:self,
            constant:kOuterRight)
        NSLayoutConstraint.size(
            view:viewOuter,
            constant:kOuterSize)
        
        NSLayoutConstraint.equals(
            view:viewMiddle,
            toView:viewOuter,
            margin:kMarginOuter)
        
        NSLayoutConstraint.equals(
            view:viewInner,
            toView:viewMiddle,
            margin:kMarginOuter)
        
        NSLayoutConstraint.topToTop(
            view:label,
            toView:self)
        NSLayoutConstraint.height(
            view:label,
            constant:kLabelHeight)
        NSLayoutConstraint.leftToLeft(
            view:label,
            toView:self)
        NSLayoutConstraint.rightToLeft(
            view:label,
            toView:viewOuter,
            constant:kLabelRight)
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
    
    func actionColors(sender button:UIButton)
    {
        controller.viewProject.showColor(
            title:NSLocalizedString("VDrawProjectMenuSettingsDefaultColor_defaultColor", comment:""),
            delegate:self)
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
    
    //MARK: color delegate
    
    func colorSelected(index:Int)
    {
        controller.modelColor.selectedItem = index
        viewInner.backgroundColor = controller.modelColor.selectedColor()
    }
}
