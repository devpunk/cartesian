import UIKit

class VDrawProjectMenuBarText:UIView
{
    private weak var controller:CDrawProject!
    private weak var viewBase:UIView!
    private weak var layoutBaseTop:NSLayoutConstraint!
    private weak var layoutBaseWidth:NSLayoutConstraint!
    private let kBorderWidth:CGFloat = 1
    private let kBaseHeight:CGFloat = 34
    private let kBaseMinWidth:CGFloat = 30
    private let kBaseMaxWidth:CGFloat = 160
    private let kBaseRight:CGFloat = -10
    
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
        viewBase.layer.cornerRadius = kBaseHeight / 2.0
        self.viewBase = viewBase
        
        addSubview(viewBase)
        
        layoutBaseTop = NSLayoutConstraint.topToTop(
            view:viewBase,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBase,
            constant:kBaseHeight)
        NSLayoutConstraint.rightToRight(
            view:viewBase,
            toView:self,
            constant:kBaseRight)
        layoutBaseWidth = NSLayoutConstraint.width(
            view:viewBase,
            constant:kBaseMinWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
    }
}
