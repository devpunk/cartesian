import UIKit

class VDrawProjectMenuLabels:UIView
{
    private weak var controller:CDrawProject!
    private weak var viewAdd:VDrawProjectMenuLabelsAdd!
    private weak var viewFontSize:VDrawProjectMenuLabelsFontSize!
    private weak var viewFontName:VDrawProjectMenuLabelsFontName!
    private let kAddWidth:CGFloat = 105
    private let kAddHeight:CGFloat = 60
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let viewAdd:VDrawProjectMenuLabelsAdd = VDrawProjectMenuLabelsAdd(
            controller:controller)
        self.viewAdd = viewAdd
        
        let viewFontSize:VDrawProjectMenuLabelsFontSize = VDrawProjectMenuLabelsFontSize(
            controller:controller)
        self.viewFontSize = viewFontSize
        
        let viewFontName:VDrawProjectMenuLabelsFontName = VDrawProjectMenuLabelsFontName(
            controller:controller)
        self.viewFontName = viewFontName
        
        addSubview(viewAdd)
        addSubview(viewFontSize)
        addSubview(viewFontName)
        
        NSLayoutConstraint.topToTop(
            view:viewAdd,
            toView:self)
        NSLayoutConstraint.height(
            view:viewAdd,
            constant:kAddHeight)
        NSLayoutConstraint.leftToLeft(
            view:viewAdd,
            toView:self)
        NSLayoutConstraint.width(
            view:viewAdd,
            constant:kAddWidth)
        
        NSLayoutConstraint.topToTop(
            view:viewFontSize,
            toView:self)
        NSLayoutConstraint.height(
            view:viewFontSize,
            constant:kAddHeight)
        NSLayoutConstraint.rightToRight(
            view:viewFontSize,
            toView:self)
        NSLayoutConstraint.leftToRight(
            view:viewFontSize,
            toView:viewAdd)
        
        NSLayoutConstraint.topToBottom(
            view:viewFontName,
            toView:viewAdd)
        NSLayoutConstraint.bottomToBottom(
            view:viewFontName,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:viewFontName,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: public
}
