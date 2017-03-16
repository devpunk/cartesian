import UIKit

class VDrawProjectFontBar:UIView
{
    private weak var controller:CDrawProject!
    private(set) weak var labelTitle:UILabel!
    private let kLabelLeft:CGFloat = 10
    private let kLabelWidth:CGFloat = 200
    private let kBorderHeight:CGFloat = 1
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let labelTitle:UILabel = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.isUserInteractionEnabled = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.font = UIFont.bold(size:15)
        labelTitle.textColor = UIColor(white:0, alpha:0.4)
        self.labelTitle = labelTitle
        
        let border:VBorder = VBorder(color:UIColor(white:0, alpha:0.1))
        
        addSubview(border)
        addSubview(labelTitle)
        
        NSLayoutConstraint.equalsVertical(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:labelTitle,
            toView:self,
            constant:kLabelLeft)
        NSLayoutConstraint.width(
            view:labelTitle,
            constant:kLabelWidth)
        
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
