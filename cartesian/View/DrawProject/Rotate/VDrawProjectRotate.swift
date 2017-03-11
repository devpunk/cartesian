import UIKit

class VDrawProjectRotate:UIView
{
    private weak var controller:CDrawProject!
    private weak var node:DNode?
    private weak var viewCircle:VDrawProjectRotateCircle!
    private weak var slider:UISlider!
    private weak var label:UILabel!
    private weak var layoutDoneLeft:NSLayoutConstraint!
    private weak var layoutResetLeft:NSLayoutConstraint!
    private let kAnimationDuration:TimeInterval = 0.3
    private let kButtonWidth:CGFloat = 120
    private let kButtonHeight:CGFloat = 36
    private let kButtonBottom:CGFloat = -20
    private let kSliderMargin:CGFloat = 15
    private let kSliderHeight:CGFloat = 55
    private let kLabelHeight:CGFloat = 40
    private let kLabelLeft:CGFloat = 12
    private let kMaxValue:Float = 180
    
    init(
        controller:CDrawProject,
        node:DNode)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        alpha = 0
        self.controller = controller
        self.node = node
        
        let blur:VBlur = VBlur.extraLight()
        
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
        buttonReset.addTarget(
            self,
            action:#selector(actionReset(sender:)),
            for:UIControlEvents.touchUpInside)
        
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
        buttonDone.addTarget(
            self,
            action:#selector(actionDone(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let slider:UISlider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumTrackTintColor = UIColor.cartesianBlue
        slider.maximumTrackTintColor = UIColor.cartesianBlue
        slider.minimumValue = -kMaxValue
        slider.maximumValue = kMaxValue
        slider.isContinuous = true
        slider.value = node.rotation
        slider.addTarget(
            self,
            action:#selector(actionSlider(sender:)),
            for:UIControlEvents.valueChanged)
        self.slider = slider
        
        let label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.numeric(size:30)
        label.textColor = UIColor.black
        self.label = label
        
        let viewCircle:VDrawProjectRotateCircle = VDrawProjectRotateCircle(
            node:node)
        self.viewCircle = viewCircle
        
        addSubview(blur)
        addSubview(viewCircle)
        addSubview(label)
        addSubview(buttonDone)
        addSubview(buttonReset)
        addSubview(slider)
        
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
        
        NSLayoutConstraint.bottomToTop(
            view:slider,
            toView:buttonReset)
        NSLayoutConstraint.height(
            view:slider,
            constant:kSliderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:slider,
            toView:self,
            margin:kSliderMargin)
        
        NSLayoutConstraint.bottomToTop(
            view:label,
            toView:slider)
        NSLayoutConstraint.height(
            view:label,
            constant:kLabelHeight)
        NSLayoutConstraint.leftToLeft(
            view:label,
            toView:self,
            constant:kLabelLeft)
        NSLayoutConstraint.rightToRight(
            view:label,
            toView:self)
        
        NSLayoutConstraint.bottomToTop(
            view:viewCircle,
            toView:label)
        NSLayoutConstraint.topToTop(
            view:viewCircle,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:viewCircle,
            toView:self)
        
        updateLabel()
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
        viewCircle.setNeedsDisplay()
        
        super.layoutSubviews()
    }
    
    //MARK: actions
    
    func actionSlider(sender slider:UISlider)
    {
        updateLabel()
        viewCircle.setNeedsDisplay()
    }
    
    func actionDone(sender button:UIButton)
    {
        animateHide()
    }
    
    func actionReset(sender button:UIButton)
    {
        slider.value = 0
        updateLabel()
        viewCircle.setNeedsDisplay()
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
    
    private func updateLabel()
    {
        let value:Float = slider.value
        let valueInt:Int = Int(value)
        let degrees:String = "\(valueInt)º"
        label.text = degrees
        node?.rotation = value
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
