import UIKit

class VDrawProjectColorBar:UIView
{
    private weak var controller:CDrawProject!
    private(set) weak var labelTitle:UILabel!
    private let kLabelTitleLeft:CGFloat = 10
    private let kLabelTitleWidth:CGFloat = 200
    private let kBorderHeight:CGFloat = 1
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let border:VBorder = VBorder(color:UIColor(white:0, alpha:0.1))
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.font = UIFont.bold(size:16)
        labelTitle.textColor = UIColor.black
        self.labelTitle = labelTitle
        
        addSubview(border)
        addSubview(labelTitle)
        
        NSLayoutConstraint.equalsVertical(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:labelTitle,
            toView:self,
            constant:kLabelTitleLeft)
        NSLayoutConstraint.width(
            view:labelTitle,
            constant:kLabelTitleWidth)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
