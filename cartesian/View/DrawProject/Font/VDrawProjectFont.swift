import UIKit

class VDrawProjectFont:UIView
{
    private let model:MDrawProjectMenuLabelsFont
    private weak var controller:CDrawProject!
    private weak var blurContainer:UIView!
    private weak var delegate:MDrawProjectFontDelegate?
    private let kAnimationDuration:TimeInterval = 0.3
    
    init(
        controller:CDrawProject,
        delegate:MDrawProjectFontDelegate)
    {
        let indexPath:IndexPath?
        
        if let model:MDrawProjectMenuLabelsFont = delegate.fontModel()
        {
            self.model = model
            indexPath = model.selectedIndex()
        }
        else
        {
            model = MDrawProjectMenuLabelsFont()
            
            if let stringSelected:String = delegate.fontCurrent()
            {
                indexPath = model.indexForName(name:stringSelected)
            }
            else
            {
                indexPath = nil
            }
        }
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        self.controller = controller
        self.delegate = delegate
        
        let blur:VBlur = VBlur.dark()
        
        let blurContainer:UIView = UIView()
        blurContainer.isUserInteractionEnabled = false
        blurContainer.clipsToBounds = true
        blurContainer.translatesAutoresizingMaskIntoConstraints = false
        blurContainer.alpha = 0
        self.blurContainer = blurContainer
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.clear
        button.addTarget(
            self,
            action:#selector(actionClose(sender:)),
            for:UIControlEvents.touchUpInside)
        
        blurContainer.addSubview(blur)
        addSubview(blurContainer)
        addSubview(button)
        
        NSLayoutConstraint.equals(
            view:blur,
            toView:blurContainer)
        
        NSLayoutConstraint.equals(
            view:blurContainer,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:button,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        
        
        super.layoutSubviews()
    }
    
    //MARK: actions
    
    func actionClose(sender button:UIButton)
    {
        animateClose()
    }
    
    //MARK: private
    
    private func animateClose()
    {
        UIApplication.shared.keyWindow!.endEditing(true)
        
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
    
    func fontSelected(item:MDrawProjectMenuLabelsFontItem)
    {
        animateClose()
        delegate?.fontSelected(model:item)
    }
    
    func animateShow()
    {
        UIView.animate(withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.blurContainer.alpha = 0.95
            self?.layoutIfNeeded()
        }
    }
}
