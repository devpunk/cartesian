import UIKit

class VDrawProjectStore:UIView
{
    private weak var controller:CDrawProject!
    private weak var purchase:MDrawProjectMenuNodesItem!
    private let kAnimationDuration:TimeInterval = 0.3
    
    init(
        controller:CDrawProject,
        purchase:MDrawProjectMenuNodesItem)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        self.purchase = purchase
        
        let blur:VBlur = VBlur.dark()
        
        let baseButton:UIButton = UIButton()
        baseButton.clipsToBounds = true
        baseButton.backgroundColor = UIColor.clear
        baseButton.translatesAutoresizingMaskIntoConstraints = false
        baseButton.addTarget(
            self,
            action:#selector(self.actionClose(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(blur)
        addSubview(baseButton)
        
        NSLayoutConstraint.equals(
            view:blur,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:baseButton,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionClose(sender button:UIButton)
    {
        animateClose()
    }
    
    //MARK: private
    
    private func animateClose()
    {
//        layoutBaseTop.constant = -kBaseHeight
        
        UIView.animate(
            withDuration:kAnimationDuration,
            animations:
            { [weak self] in
                
                self?.alpha = 0
                self?.layoutIfNeeded()
            })
        { [weak self] (done:Bool) in
            
            self?.removeFromSuperview()
        }
    }
    
    //MARK: public
    
    func animateShow()
    { 
//        layoutBaseTop.constant = 0
        
        UIView.animate(withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.blurContainer.alpha = 0.95
            self?.layoutIfNeeded()
        }
    }
}
