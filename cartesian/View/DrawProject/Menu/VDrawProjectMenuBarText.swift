import UIKit

class VDrawProjectMenuBarText:UIView
{
    private weak var controller:CDrawProject!
    private weak var viewBase:UIView!
    private weak var layoutButtonTop:NSLayoutConstraint!
    private weak var layoutBaseTop:NSLayoutConstraint!
    private weak var layoutBaseWidth:NSLayoutConstraint!
    private let kBorderWidth:CGFloat = 1
    private let kContentHeight:CGFloat = 34
    private let kBaseMinWidth:CGFloat = 30
    private let kBaseMaxWidth:CGFloat = 160
    private let kButtonWidth:CGFloat = 60
    private let kButtonRight:CGFloat = -10
    private let kBaseRight:CGFloat = -10
    private let kButtonCornerRadius:CGFloat = 6
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        
        let viewBase:UIView = UIView()
        viewBase.translatesAutoresizingMaskIntoConstraints = false
        viewBase.clipsToBounds = true
        viewBase.backgroundColor = UIColor.white
        viewBase.layer.borderWidth = kBorderWidth
        viewBase.layer.borderColor = UIColor(white:0, alpha:0.1).cgColor
        viewBase.layer.cornerRadius = kContentHeight / 2.0
        self.viewBase = viewBase
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.cartesianBlue
        button.clipsToBounds = true
        button.setTitleColor(
            UIColor.white,
            for:UIControlState.normal)
        button.setTitleColor(
            UIColor(white:1, alpha:0.2),
            for:UIControlState.highlighted)
        button.setTitle(
            NSLocalizedString("VDrawProjectMenuBarText_button", comment:""),
            for:UIControlState.normal)
        button.titleLabel!.font = UIFont.bold(size:14)
        button.layer.cornerRadius = kButtonCornerRadius
        
        addSubview(viewBase)
        addSubview(button)
        
        layoutBaseTop = NSLayoutConstraint.topToTop(
            view:viewBase,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBase,
            constant:kContentHeight)
        NSLayoutConstraint.rightToLeft(
            view:viewBase,
            toView:button,
            constant:kBaseRight)
        layoutBaseWidth = NSLayoutConstraint.width(
            view:viewBase,
            constant:kBaseMinWidth)
        
        layoutButtonTop = NSLayoutConstraint.topToTop(
            view:button,
            toView:self)
        NSLayoutConstraint.height(
            view:button,
            constant:kContentHeight)
        NSLayoutConstraint.rightToRight(
            view:button,
            toView:self,
            constant:kButtonRight)
        NSLayoutConstraint.width(
            view:button,
            constant:kButtonWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let height:CGFloat = bounds.maxY
        let remainContent:CGFloat = height - kContentHeight
        let marginTop:CGFloat = remainContent / 2.0
        layoutButtonTop.constant = marginTop
        layoutBaseTop.constant = marginTop
        
        super.layoutSubviews()
    }
}
