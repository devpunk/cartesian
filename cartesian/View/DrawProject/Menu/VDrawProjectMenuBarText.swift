import UIKit

class VDrawProjectMenuBarText:UIView
{
    private(set) weak var textView:UITextView!
    private weak var controller:CDrawProject!
    private weak var viewBase:UIView!
    private weak var layoutButtonTop:NSLayoutConstraint!
    private weak var layoutBaseTop:NSLayoutConstraint!
    private let kBorderWidth:CGFloat = 1
    private let kContentHeight:CGFloat = 32
    private let kBaseWidth:CGFloat = 200
    private let kButtonWidth:CGFloat = 60
    private let kInsets:CGFloat = 5
    
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
        viewBase.layer.borderColor = UIColor(white:0, alpha:0.4).cgColor
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
        
        let textView:UITextView = UITextView()
        textView.clipsToBounds = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = UIColor.clear
        textView.textColor = UIColor.black
        textView.tintColor = UIColor.black
        textView.bounces = true
        textView.isScrollEnabled = true
        textView.returnKeyType = UIReturnKeyType.default
        textView.keyboardAppearance = UIKeyboardAppearance.light
        textView.autocorrectionType = UITextAutocorrectionType.no
        textView.spellCheckingType = UITextSpellCheckingType.no
        textView.autocapitalizationType = UITextAutocapitalizationType.none
        textView.keyboardType = UIKeyboardType.alphabet
        textView.contentInset = UIEdgeInsets.zero
        textView.font = UIFont.medium(size:18)
        textView.textContainerInset = UIEdgeInsets(
            top:0,
            left:kInsets,
            bottom:0,
            right:kInsets)
        self.textView = textView
        
        viewBase.addSubview(textView)
        addSubview(viewBase)
        addSubview(button)
        
        layoutBaseTop = NSLayoutConstraint.topToTop(
            view:viewBase,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBase,
            constant:kContentHeight)
        NSLayoutConstraint.rightToLeft(
            view:viewBase,
            toView:button)
        NSLayoutConstraint.width(
            view:viewBase,
            constant:kBaseWidth)
        
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
        
        NSLayoutConstraint.equals(
            view:textView,
            toView:viewBase)
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
        
        super.layoutSubviews()
    }
}
