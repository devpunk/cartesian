import UIKit

class VDrawProjectSizeDimension:UIView
{
    private(set) weak var textField:UITextField!
    private let kLabelHeight:CGFloat = 45
    private let kLabelBottom:CGFloat = -5
    private let kFieldMargin:CGFloat = 19
    private let kFieldTop:CGFloat = 25
    private let kCornerRadius:CGFloat = 4
    private let kBackgroundMargin:CGFloat = 9
    private let kBorderWidth:CGFloat = 1
    
    init(title:String)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.regular(size:16)
        label.textColor = UIColor.black
        label.text = title
        
        let textField:UITextField = UITextField()
        textField.borderStyle = UITextBorderStyle.none
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.clipsToBounds = true
        textField.backgroundColor = UIColor.clear
        textField.placeholder = NSLocalizedString("VDrawProjectSizeDimension_placeholder", comment:"")
        textField.keyboardType = UIKeyboardType.numbersAndPunctuation
        textField.keyboardAppearance = UIKeyboardAppearance.light
        textField.spellCheckingType = UITextSpellCheckingType.no
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        textField.clearButtonMode = UITextFieldViewMode.never
        textField.returnKeyType = UIReturnKeyType.next
        textField.tintColor = UIColor.black
        textField.textColor = UIColor.black
        textField.font = UIFont.numeric(size:20)
        self.textField = textField
        
        let background:UIView = UIView()
        background.backgroundColor = UIColor.white
        background.translatesAutoresizingMaskIntoConstraints = false
        background.clipsToBounds = true
        background.isUserInteractionEnabled = false
        background.layer.cornerRadius = kCornerRadius
        background.layer.borderColor = UIColor(white:0, alpha:0.1).cgColor
        background.layer.borderWidth = kBorderWidth
        
        addSubview(label)
        addSubview(background)
        addSubview(textField)
        
        NSLayoutConstraint.bottomToBottom(
            view:label,
            toView:self,
            constant:kLabelBottom)
        NSLayoutConstraint.height(
            view:label,
            constant:kLabelHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:label,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:textField,
            toView:self,
            constant:kFieldTop)
        NSLayoutConstraint.bottomToTop(
            view:textField,
            toView:label)
        NSLayoutConstraint.equalsHorizontal(
            view:textField,
            toView:self,
            margin:kFieldMargin)
        
        NSLayoutConstraint.equals(
            view:textField,
            toView:background,
            margin:kBackgroundMargin)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
