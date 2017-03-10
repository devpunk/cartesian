import UIKit

class VDrawProjectRotate:UIView
{
    private weak var controller:CDrawProject!
    private let kAnimationDuration:TimeInterval = 0.3
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let blur:VBlur = VBlur.light()
        
        addSubview(blur)
        
        NSLayoutConstraint.equals(
            view:blur,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: public
    
    func animateShow()
    {
        UIView.animate(withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.alpha = 1
        }
    }
    
    func animateHide()
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
}
