import UIKit

class VDrawProjectColorBar:UIView
{
    private weak var controller:CDrawProject!
    private(set) weak var labelTitle:UILabel!
    private let kLabelTitleLeft:CGFloat = 10
    private let kLabelTitleWidth:CGFloat = 200
    private let kButtonCloseWidth:CGFloat = 100
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
        labelTitle.font = UIFont.medium(size:16)
        labelTitle.textColor = UIColor.black
        self.labelTitle = labelTitle
        
        let buttonClose:UIButton = UIButton()
        buttonClose.translatesAutoresizingMaskIntoConstraints = false
        buttonClose.setTitleColor(
            UIColor.cartesianOrange,
            for:UIControlState.normal)
        buttonClose.setTitleColor(
            UIColor(white:0, alpha:0.2),
            for:UIControlState.highlighted)
        buttonClose.setTitle(
            NSLocalizedString("VDrawProjectColorBar_buttonClose", comment:""),
            for:UIControlState.normal)
        buttonClose.titleLabel!.font = UIFont.bolder(size:17)
        buttonClose.addTarget(
            self,
            action:#selector(actionClose(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(border)
        addSubview(labelTitle)
        addSubview(buttonClose)
        
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
        
        NSLayoutConstraint.equalsVertical(
            view:buttonClose,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:buttonClose,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonClose,
            constant:kButtonCloseWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionClose(sender button:UIButton)
    {
        controller.viewProject.viewColor?.animateClose()
    }
}
