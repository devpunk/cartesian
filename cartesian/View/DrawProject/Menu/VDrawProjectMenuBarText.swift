import UIKit

class VDrawProjectMenuBarText:UIView
{
    private(set) weak var textField:UITextField!
    private weak var controller:CDrawProject!
    private weak var viewBase:UIView!
    private weak var layoutButtonTop:NSLayoutConstraint!
    private weak var layoutButtonCloseTop:NSLayoutConstraint!
    private weak var layoutBaseTop:NSLayoutConstraint!
    private let kBorderWidth:CGFloat = 1
    private let kContentHeight:CGFloat = 34
    private let kButtonWidth:CGFloat = 50
    private let kInsets:CGFloat = 10
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let viewBase:UIView = UIView()
        viewBase.translatesAutoresizingMaskIntoConstraints = false
        viewBase.clipsToBounds = true
        viewBase.backgroundColor = UIColor.white
        viewBase.layer.borderWidth = kBorderWidth
        viewBase.layer.borderColor = UIColor(white:0, alpha:0.1).cgColor
        viewBase.layer.cornerRadius = kContentHeight / 2.0
        self.viewBase = viewBase
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.setImage(
            #imageLiteral(resourceName: "assetGenericSend").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.normal)
        button.setImage(
            #imageLiteral(resourceName: "assetGenericSend").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.highlighted)
        button.imageView!.clipsToBounds = true
        button.imageView!.contentMode = UIViewContentMode.center
        button.imageView!.tintColor = UIColor(white:0, alpha:0.1)
        button.addTarget(
            self,
            action:#selector(actionSender(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let buttonClose:UIButton = UIButton()
        buttonClose.translatesAutoresizingMaskIntoConstraints = false
        buttonClose.clipsToBounds = true
        buttonClose.setImage(
            #imageLiteral(resourceName: "assetGenericClose").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.normal)
        buttonClose.setImage(
            #imageLiteral(resourceName: "assetGenericClose").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.highlighted)
        buttonClose.imageView!.clipsToBounds = true
        buttonClose.imageView!.contentMode = UIViewContentMode.center
        buttonClose.imageView!.tintColor = UIColor(white:0, alpha:0.1)
        buttonClose.addTarget(
            self,
            action:#selector(actionClose(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let textField:UITextField = UITextField()
        textField.borderStyle = UITextBorderStyle.none
        textField.clearButtonMode = UITextFieldViewMode.never
        textField.clipsToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.clear
        textField.textColor = UIColor.black
        textField.tintColor = UIColor.black
        textField.returnKeyType = UIReturnKeyType.default
        textField.keyboardAppearance = UIKeyboardAppearance.light
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.spellCheckingType = UITextSpellCheckingType.no
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        textField.keyboardType = UIKeyboardType.alphabet
        textField.font = UIFont.bold(size:15)
        self.textField = textField
        
        viewBase.addSubview(textField)
        addSubview(viewBase)
        addSubview(button)
        addSubview(buttonClose)
        
        layoutBaseTop = NSLayoutConstraint.topToTop(
            view:viewBase,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBase,
            constant:kContentHeight)
        NSLayoutConstraint.rightToLeft(
            view:viewBase,
            toView:button)
        NSLayoutConstraint.leftToRight(
            view:viewBase,
            toView:buttonClose)
        
        layoutButtonTop = NSLayoutConstraint.topToTop(
            view:button,
            toView:self)
        NSLayoutConstraint.height(
            view:button,
            constant:kContentHeight)
        NSLayoutConstraint.rightToRight(
            view:button,
            toView:self)
        NSLayoutConstraint.width(
            view:button,
            constant:kButtonWidth)
        
        layoutButtonCloseTop = NSLayoutConstraint.topToTop(
            view:buttonClose,
            toView:self)
        NSLayoutConstraint.height(
            view:buttonClose,
            constant:kContentHeight)
        NSLayoutConstraint.leftToLeft(
            view:buttonClose,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonClose,
            constant:kButtonWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:textField,
            toView:viewBase)
        NSLayoutConstraint.equalsHorizontal(
            view:textField,
            toView:viewBase,
            margin:kInsets)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let height:CGFloat = bounds.maxY
        let remainContent:CGFloat = height - kContentHeight
        let marginTop:CGFloat = remainContent / 2.0
        layoutButtonTop.constant = marginTop
        layoutBaseTop.constant = marginTop
        layoutButtonCloseTop.constant = marginTop
        
        super.layoutSubviews()
    }
    
    //MARK: actions
    
    func actionSender(sender button:UIButton)
    {
        UIApplication.shared.keyWindow!.endEditing(true)
    }
    
    func actionClose(sender button:UIButton)
    {
        textField.delegate = nil
        UIApplication.shared.keyWindow!.endEditing(true)
        controller.endText()
    }
}
