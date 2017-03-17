import UIKit

class VDrawProjectMenuLabelsFontSize:UIView
{
    private weak var controller:CDrawProject!
    private weak var label:UILabel!
    private(set) weak var stepper:UIStepper!
    private let attributesNumber:[String:AnyObject]
    private let stringTitle:NSAttributedString
    private let kStepperTop:CGFloat = 15
    private let kStepperWidth:CGFloat = 110
    private let kLabelRight:CGFloat = -6
    private let kMinValue:Double = 10
    private let kMaxValue:Double = 30
    private let kDefaultValue:Double = 16
    
    init(controller:CDrawProject)
    {
        let attributesTitle:[String:AnyObject] = [
            NSFontAttributeName:UIFont.bold(size:15),
            NSForegroundColorAttributeName:UIColor.cartesianBlue]
        attributesNumber = [
            NSFontAttributeName:UIFont.numeric(size:15),
            NSForegroundColorAttributeName:UIColor.black]
        stringTitle = NSAttributedString(
            string:NSLocalizedString("VDrawProjectMenuLabelsFontSize_labelTitle", comment:""),
            attributes:attributesTitle)
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.right
        self.label = label
        
        let stepper:UIStepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.tintColor = UIColor.black
        stepper.minimumValue = kMinValue
        stepper.maximumValue = kMaxValue
        stepper.value = kDefaultValue
        stepper.addTarget(
            self,
            action:#selector(actionStepper(sender:)),
            for:UIControlEvents.valueChanged)
        self.stepper = stepper
        
        addSubview(label)
        addSubview(stepper)
        
        NSLayoutConstraint.topToTop(
            view:stepper,
            toView:self,
            constant:kStepperTop)
        NSLayoutConstraint.bottomToBottom(
            view:stepper,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:stepper,
            toView:self)
        NSLayoutConstraint.width(
            view:stepper,
            constant:kStepperWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:label,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:label,
            toView:self)
        NSLayoutConstraint.rightToLeft(
            view:label,
            toView:stepper,
            constant:kLabelRight)
        
        printLabel()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionStepper(sender stepper:UIStepper)
    {
        printLabel()
    }
    
    //MARK: private
    
    private func printLabel()
    {
        let currentValue:Int = Int(stepper.value)
        let stringValue:String = "\(currentValue)"
        let attributedStringValue:NSAttributedString = NSAttributedString(
            string:stringValue,
            attributes:attributesNumber)
        let mutableString:NSMutableAttributedString = NSMutableAttributedString()
        mutableString.append(stringTitle)
        mutableString.append(attributedStringValue)
        
        label.attributedText = mutableString
    }
}
