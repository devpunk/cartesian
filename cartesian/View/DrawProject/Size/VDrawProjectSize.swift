import UIKit

class VDrawProjectSize:UIView, UITextFieldDelegate
{
    private(set) weak var viewBar:VDrawProjectSizeBar!
    private weak var controller:CDrawProject!
    private weak var delegate:MDrawProjectSizeDelegate?
    private weak var blurContainer:UIView!
    private weak var viewWidth:VDrawProjectSizeDimension!
    private weak var viewHeight:VDrawProjectSizeDimension!
    private weak var layoutBaseTop:NSLayoutConstraint!
    private let numberFormatter:NumberFormatter
    private let kBarHeight:CGFloat = 60
    private let kBaseHeight:CGFloat = 160
    private let kDimensionWidth:CGFloat = 150
    private let kAnimationDuration:TimeInterval = 0.3
    private let kMaxFractions:Int = 0
    private let kMinFractions:Int = 0
    private let kMinIntegers:Int = 1
    private let kGroupSeparator:Bool = false
    
    init(
        controller:CDrawProject,
        delegate:MDrawProjectSizeDelegate)
    {
        numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.minimumFractionDigits = kMinFractions
        numberFormatter.maximumFractionDigits = kMaxFractions
        numberFormatter.minimumIntegerDigits = kMinIntegers
        numberFormatter.usesGroupingSeparator = kGroupSeparator
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        self.delegate = delegate
        
        let blurContainer:UIView = UIView()
        blurContainer.isUserInteractionEnabled = false
        blurContainer.clipsToBounds = true
        blurContainer.translatesAutoresizingMaskIntoConstraints = false
        blurContainer.alpha = 0
        self.blurContainer = blurContainer
        
        let blur:VBlur = VBlur.dark()
        
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
        baseView.backgroundColor = UIColor(white:0.97, alpha:1)
        
        let viewBar:VDrawProjectSizeBar = VDrawProjectSizeBar(
            controller:controller)
        self.viewBar = viewBar
        
        let viewWidth:VDrawProjectSizeDimension = VDrawProjectSizeDimension(
            title:NSLocalizedString("VDrawProjectSize_titleWidth", comment:""))
        viewWidth.textField.delegate = self
        self.viewWidth = viewWidth
        
        let viewHeight:VDrawProjectSizeDimension = VDrawProjectSizeDimension(
            title:NSLocalizedString("VDrawProjectSize_titleHeight", comment:""))
        viewHeight.textField.delegate = self
        self.viewHeight = viewHeight
        
        blurContainer.addSubview(blur)
        baseView.addSubview(viewBar)
        baseView.addSubview(viewWidth)
        baseView.addSubview(viewHeight)
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
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:baseView)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:kBarHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:baseView)
        
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
        
        NSLayoutConstraint.topToBottom(
            view:viewWidth,
            toView:viewBar)
        NSLayoutConstraint.bottomToBottom(
            view:viewWidth,
            toView:baseView)
        NSLayoutConstraint.leftToLeft(
            view:viewWidth,
            toView:baseView)
        NSLayoutConstraint.width(
            view:viewWidth,
            constant:kDimensionWidth)
        
        NSLayoutConstraint.topToBottom(
            view:viewHeight,
            toView:viewBar)
        NSLayoutConstraint.bottomToBottom(
            view:viewHeight,
            toView:baseView)
        NSLayoutConstraint.leftToRight(
            view:viewHeight,
            toView:viewWidth)
        NSLayoutConstraint.width(
            view:viewHeight,
            constant:kDimensionWidth)
        
        let scalarWidth:CGFloat = delegate.originalWidth()
        let scalarHeight:CGFloat = delegate.originalHeight()
        let stringWidth:String = stringFromNumber(scalar:scalarWidth)
        let stringHeight:String = stringFromNumber(scalar:scalarHeight)
        
        viewWidth.textField.text = stringWidth
        viewHeight.textField.text = stringHeight
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
    
    private func stringFromNumber(scalar:CGFloat) -> String
    {
        let number:NSNumber = scalar as NSNumber
        
        guard
        
            let string:String = numberFormatter.string(from:number)
        
        else
        {
            let defaultString:String = NSLocalizedString("VDrawProjectSize_default", comment:"")
            
            return defaultString
        }
        
        return string
    }
    
    private func cleanNumber(string:String) -> String
    {
        let scalar:CGFloat = scalarFromString(string:string)
        let cleaned:String = stringFromNumber(scalar:scalar)
        
        return cleaned
    }
    
    private func scalarFromString(string:String) -> CGFloat
    {
        guard
            
            let number:NSNumber = numberFormatter.number(from:string)
            
        else
        {
            return 0
        }
        
        let scalar:CGFloat = CGFloat(number)
        
        return scalar
    }
    
    private func postChanges()
    {
        guard
            
            let rawWidth:String = viewWidth.textField.text,
            let rawHeight:String = viewHeight.textField.text,
            let originalWidth:CGFloat = delegate?.originalWidth(),
            let originalHeight:CGFloat = delegate?.originalHeight()
            
        else
        {
            return
        }
        
        let scalarWidth:CGFloat = scalarFromString(string:rawWidth)
        let scalarHeight:CGFloat = scalarFromString(string:rawHeight)
        
        if scalarWidth != originalWidth || scalarHeight != originalHeight
        {
            delegate?.sizeChanged(
                width:scalarWidth,
                height:scalarHeight)
        }
    }
    
    //MARK: public
    
    func animateClose()
    {
        UIApplication.shared.keyWindow!.endEditing(true)
        
        UIView.animate(
            withDuration:kAnimationDuration,
            animations:
            { [weak self] in
                
                self?.alpha = 0
            })
        { [weak self] (done:Bool) in
            
            self?.postChanges()
            self?.removeFromSuperview()
        }
    }
    
    func animateShow()
    {
        layoutBaseTop.constant = 0
        
        UIView.animate(withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.blurContainer.alpha = 0.95
            self?.layoutIfNeeded()
        }
    }
    
    //MARK: textfield delegate
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool
    {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField:UITextField)
    {
        guard
            
            let original:String = textField.text
        
        else
        {
            return
        }
        
        let cleaned:String = cleanNumber(string:original)
        
        textField.text = cleaned
    }
}
