import UIKit

class VDrawProjectFontSize:UIView
{
    private weak var controller:CDrawProject!
    private weak var delegate:MDrawProjectFontSizeDelegate?
    private weak var blurContainer:UIView!
    private weak var viewStepper:VDrawProjectFontSizeStepper!
    private weak var layoutBaseTop:NSLayoutConstraint!
    private weak var layoutButtonLeft:NSLayoutConstraint!
    private let kBaseHeight:CGFloat = 120
    private let kStepperWidth:CGFloat = 200
    private let kStepperHeight:CGFloat = 70
    private let kButtonWidth:CGFloat = 100
    private let kButtonHeight:CGFloat = 34
    private let kButtonBottom:CGFloat = -8
    private let kCornerRadius:CGFloat = 8
    private let kLabelLeft:CGFloat = 10
    private let kLabelWidth:CGFloat = 200
    private let kAnimationDuration:TimeInterval = 0.3
    
    init(
        controller:CDrawProject,
        delegate:MDrawProjectFontSizeDelegate)
    {
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
        
        let baseView:UIView = UIView()
        baseView.translatesAutoresizingMaskIntoConstraints = false
        baseView.clipsToBounds = true
        baseView.backgroundColor = UIColor.white
        
        let viewStepper:VDrawProjectFontSizeStepper = VDrawProjectFontSizeStepper()
        self.viewStepper = viewStepper
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.font = UIFont.medium(size:17)
        label.textColor = UIColor.black
        label.text = NSLocalizedString("VDrawProjectFontSize_labelTitle", comment:"")
        
        let buttonDone:UIButton = UIButton()
        buttonDone.backgroundColor = UIColor.cartesianBlue
        buttonDone.translatesAutoresizingMaskIntoConstraints = false
        buttonDone.clipsToBounds = true
        buttonDone.setTitleColor(
            UIColor.white,
            for:UIControlState.normal)
        buttonDone.setTitleColor(
            UIColor(white:1, alpha:0.2),
            for:UIControlState.highlighted)
        buttonDone.setTitle(
            NSLocalizedString("VDrawProjectFontSize_buttonDone", comment:""),
            for:UIControlState.normal)
        buttonDone.titleLabel!.font = UIFont.bold(size:14)
        buttonDone.layer.cornerRadius = kCornerRadius
        buttonDone.addTarget(
            self,
            action:#selector(actionClose(sender:)),
            for:UIControlEvents.touchUpInside)
        
        baseView.addSubview(label)
        baseView.addSubview(viewStepper)
        baseView.addSubview(buttonDone)
        blurContainer.addSubview(blur)
        addSubview(blurContainer)
        addSubview(button)
        addSubview(baseView)
        
        NSLayoutConstraint.equals(
            view:blur,
            toView:blurContainer)
        
        NSLayoutConstraint.equals(
            view:blurContainer,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:button,
            toView:self)
        
        layoutBaseTop = NSLayoutConstraint.topToTop(
            view:baseView,
            toView:self,
            constant:-kBaseHeight)
        NSLayoutConstraint.height(
            view:baseView,
            constant:kBaseHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:baseView,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:viewStepper,
            toView:baseView)
        NSLayoutConstraint.height(
            view:viewStepper,
            constant:kStepperHeight)
        NSLayoutConstraint.rightToRight(
            view:viewStepper,
            toView:self)
        NSLayoutConstraint.width(
            view:viewStepper,
            constant:kStepperWidth)
        
        NSLayoutConstraint.topToTop(
            view:label,
            toView:baseView)
        NSLayoutConstraint.height(
            view:label,
            constant:kStepperHeight)
        NSLayoutConstraint.leftToLeft(
            view:label,
            toView:baseView,
            constant:kLabelLeft)
        NSLayoutConstraint.width(
            view:label,
            constant:kLabelWidth)
        
        NSLayoutConstraint.bottomToBottom(
            view:buttonDone,
            toView:baseView,
            constant:kButtonBottom)
        NSLayoutConstraint.height(
            view:buttonDone,
            constant:kButtonHeight)
        layoutButtonLeft = NSLayoutConstraint.leftToLeft(
            view:buttonDone,
            toView:baseView)
        NSLayoutConstraint.width(
            view:buttonDone,
            constant:kButtonWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.maxX
        let remainLeft:CGFloat = width - kButtonWidth
        let left:CGFloat = remainLeft / 2.0
        layoutButtonLeft.constant = left
        
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
        let selectedFont:Int16 = viewStepper.selectedFont()
        delegate?.fontSizeSelected(size:selectedFont)
        
        layoutBaseTop.constant = -kBaseHeight
        
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
        let currentSize:Int16? = delegate?.fontCurrentSize()
        viewStepper.updateFont(current:currentSize)
        
        layoutBaseTop.constant = 0
        
        UIView.animate(withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.blurContainer.alpha = 0.95
            self?.layoutIfNeeded()
        }
    }
}
