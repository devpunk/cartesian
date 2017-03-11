import UIKit

class VDrawProjectRotate:UIView
{
    private weak var controller:CDrawProject!
    private weak var node:DNode?
    private weak var layoutDoneLeft:NSLayoutConstraint!
    private weak var layoutResetLeft:NSLayoutConstraint!
    private let kAnimationDuration:TimeInterval = 0.3
    private let kButtonWidth:CGFloat = 120
    private let kButtonHeight:CGFloat = 36
    private let kButtonBottom:CGFloat = -20
    
    init(
        controller:CDrawProject,
        node:DNode)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        self.node = node
        
        let blur:VBlur = VBlur.light()
        
        let buttonReset:UIButton = UIButton()
        buttonReset.translatesAutoresizingMaskIntoConstraints = false
        buttonReset.setTitleColor(
            UIColor.black,
            for:UIControlState.normal)
        buttonReset.setTitleColor(
            UIColor(white:0, alpha:0.2),
            for:UIControlState.highlighted)
        buttonReset.setTitle(
            NSLocalizedString("VDrawProjectRotate_buttonReset", comment:""),
            for:UIControlState.normal)
        buttonReset.titleLabel!.font = UIFont.regular(size:14)
        
        let buttonDone:UIButton = UIButton()
        buttonDone.translatesAutoresizingMaskIntoConstraints = false
        buttonDone.backgroundColor = UIColor.cartesianBlue
        buttonDone.clipsToBounds = true
        buttonDone.setTitleColor(
            UIColor.white,
            for:UIControlState.normal)
        buttonDone.setTitleColor(
            UIColor(white:1, alpha:0),
            for:UIControlState.highlighted)
        buttonDone.setTitle(
            NSLocalizedString("VDrawProjectRotate_buttonDone", comment:""),
            for:UIControlState.normal)
        buttonDone.titleLabel!.font = UIFont.bold(size:14)
        buttonDone.layer.cornerRadius = kButtonHeight / 2.0
        
        addSubview(blur)
        addSubview(buttonDone)
        addSubview(buttonReset)
        
        NSLayoutConstraint.equals(
            view:blur,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:buttonDone,
            toView:self,
            constant:kButtonBottom)
        NSLayoutConstraint.height(
            view:buttonDone,
            constant:kButtonHeight)
        NSLayoutConstraint.width(
            view:buttonDone,
            constant:kButtonWidth)
        layoutDoneLeft = NSLayoutConstraint.leftToLeft(
            view:buttonDone,
            toView:self)
        
        NSLayoutConstraint.bottomToTop(
            view:buttonReset,
            toView:buttonDone)
        NSLayoutConstraint.height(
            view:buttonReset,
            constant:kButtonHeight)
        NSLayoutConstraint.width(
            view:buttonReset,
            constant:kButtonWidth)
        layoutResetLeft = NSLayoutConstraint.leftToLeft(
            view:buttonReset,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.maxX
        let buttonRemain:CGFloat = width - kButtonWidth
        let buttonMargin:CGFloat = buttonRemain / 2.0
        layoutDoneLeft.constant = buttonMargin
        layoutResetLeft.constant = buttonMargin
        
        super.layoutSubviews()
    }
    
    //MARK: private
    
    private func animateHide()
    {
        UIView.animate(
            withDuration:kAnimationDuration,
            animations:
            { [weak self] in
                
                self?.alpha = 0
            })
        { [weak self] (done:Bool) in
            
            self?.removeFromSuperview()
        }
    }
    
    //MARK: public
    
    func animateShow()
    {
        UIView.animate(withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.alpha = 1
        }
    }
}
