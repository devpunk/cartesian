import UIKit

class VDrawProjectSizeDimension:UIView
{
    private(set) weak var textField:UITextField!
    private let originalSize:Int
    private let kPlaceholder:String = "0"
    private let kLabelHeight:CGFloat = 20
    private let kLabelBottom:CGFloat = -10
    private let kFieldMargin:CGFloat = 14
    private let kCornerRadius:CGFloat = 10
    private let kBackgroundMargin:CGFloat = -4
    
    init(title:String, originalSize:Int)
    {
        self.originalSize = originalSize
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.regular(size:14)
        label.textColor = UIColor.black
        
        let textField:UITextField = UITextField()
        textField.borderStyle = UITextBorderStyle.none
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.clipsToBounds = true
        textField.backgroundColor = UIColor.white
        textField.placeholder = kPlaceholder
        textField.keyboardType = UIKeyboardType.numbersAndPunctuation
        textField.keyboardAppearance = UIKeyboardAppearance.light
        textField.spellCheckingType = UITextSpellCheckingType.no
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        textField.clearButtonMode = UITextFieldViewMode.never
        textField.returnKeyType = UIReturnKeyType.next
        textField.tintColor = UIColor.black
        textField.textColor = UIColor.black
        textField.font = UIFont.numeric(size:18)
        self.textField = textField
        
        let background:UIView = UIView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.clipsToBounds = true
        background.isUserInteractionEnabled = false
        background.layer.cornerRadius = kCornerRadius
        
        addSubview(label)
        addSubview(background)
        addSubview(textField)
        
        NSLayoutConstraint.equalsHorizontal(
            view:label,
            toView:self)
        NSLayoutConstraint.bottomToBottom(
            view:label,
            toView:self,
            constant:kLabelBottom)
        NSLayoutConstraint.height(
            view:label,
            constant:kLabelHeight)
        
        NSLayoutConstraint.topToTop(
            view:textField,
            toView:self,
            constant:kFieldMargin)
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
