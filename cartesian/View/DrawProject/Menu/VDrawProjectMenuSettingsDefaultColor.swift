import UIKit

class VDrawProjectMenuSettingsDefaultColor:UIButton
{
    private weak var controller:CDrawProject!
    private weak var viewInner:UIView!
    private weak var layoutOuterColorWidth:NSLayoutConstraint!
    private let kMarginOuter:CGFloat = -2
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
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
        self.viewInner = viewInner
        
        addSubview(viewOuter)
        addSubview(viewMiddle)
        addSubview(viewInner)
        
        NSLayoutConstraint.equalsVertical(
            view:viewOuter,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:viewOuter,
            toView:self)
        layoutOuterColorWidth = NSLayoutConstraint.width(
            view:viewOuter)
        
        NSLayoutConstraint.equals(
            view:viewMiddle,
            toView:viewOuter,
            margin:kMarginOuter)
        
        NSLayoutConstraint.equals(
            view:viewInner,
            toView:viewMiddle,
            margin:kMarginOuter)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let height:CGFloat = bounds.maxY
        layoutOuterColorWidth.constant = height
        
        super.layoutSubviews()
    }
}
