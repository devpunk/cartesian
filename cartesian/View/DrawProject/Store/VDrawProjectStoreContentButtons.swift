import UIKit

class VDrawProjectStoreContentButtons:UIView
{
    private weak var controller:CDrawProject!
    private let kButtonMargin:CGFloat = 1
    private let kButtonWidth:CGFloat = 148
    
    convenience init(controller:CDrawProject)
    {
        self.init()
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(white:0.97, alpha:1)
        self.controller = controller
        
        let buttonStore:UIButton = UIButton()
        buttonStore.translatesAutoresizingMaskIntoConstraints = false
        buttonStore.clipsToBounds = true
        buttonStore.backgroundColor = UIColor.white
        buttonStore.setTitle(
            NSLocalizedString("VDrawProjectStoreContentButtons_buttonStore", comment:""),
            for:UIControlState.normal)
        buttonStore.setTitleColor(
            UIColor.cartesianBlue,
            for:UIControlState.normal)
        buttonStore.setTitleColor(
            UIColor(white:0, alpha:0.1),
            for:UIControlState.highlighted)
        buttonStore.titleLabel!.font = UIFont.bold(size:14)
        buttonStore.addTarget(
            self,
            action:#selector(actionStore(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let buttonCancel:UIButton = UIButton()
        buttonCancel.translatesAutoresizingMaskIntoConstraints = false
        buttonCancel.clipsToBounds = true
        buttonCancel.backgroundColor = UIColor.white
        buttonCancel.setTitle(
            NSLocalizedString("VDrawProjectStoreContentButtons_buttonCancel", comment:""),
            for:UIControlState.normal)
        buttonCancel.setTitleColor(
            UIColor(white:0.6, alpha:1),
            for:UIControlState.normal)
        buttonCancel.setTitleColor(
            UIColor(white:0, alpha:0.1),
            for:UIControlState.highlighted)
        buttonCancel.titleLabel!.font = UIFont.bold(size:14)
        buttonCancel.addTarget(
            self,
            action:#selector(self.actionCancel(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(buttonStore)
        addSubview(buttonCancel)
        
        NSLayoutConstraint.topToTop(
            view:buttonCancel,
            toView:self,
            constant:kButtonMargin)
        NSLayoutConstraint.bottomToBottom(
            view:buttonCancel,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:buttonCancel,
            toView:self,
            constant:kButtonMargin)
        NSLayoutConstraint.width(
            view:buttonCancel,
            constant:kButtonWidth)
        
        NSLayoutConstraint.topToTop(
            view:buttonStore,
            toView:self,
            constant:kButtonMargin)
        NSLayoutConstraint.bottomToBottom(
            view:buttonStore,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:buttonStore,
            toView:self,
            constant:-kButtonMargin)
        NSLayoutConstraint.width(
            view:buttonStore,
            constant:kButtonWidth)
    }
    
    //MARK: actions
    
    func actionStore(sender button:UIButton)
    {
    }
    
    func actionCancel(sender button:UIButton)
    {
        
    }
}
