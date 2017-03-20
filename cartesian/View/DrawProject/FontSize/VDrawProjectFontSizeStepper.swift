import UIKit

class VDrawProjectFontSizeStepper:UIView
{
    private weak var stepper:UIStepper!
    private weak var label:UILabel!
    private let kStepperTop:CGFloat = 20
    private let kStepperWidth:CGFloat = 110
    private let kLabelRight:CGFloat = -6
    private let kMinValue:Double = 10
    private let kMaxValue:Double = 30
    private let kDefaultValue:Double = 16
    
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        
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
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionStepper(sender stepper:UIStepper)
    {
        updateLabel()
    }
    
    //MARK: private
    
    private func updateLabel()
    {
        let valueInt:Int = Int(stepper.value)
        let valueString:String = "\(valueInt)"
        label.text = valueString
    }
    
    //MARK: public
    
    func selectedFont() -> Int16
    {
        let value:Double = stepper.value
        let intValue:Int16 = Int16(value)
        
        return intValue
    }
    
    func updateFont(current:Int16?)
    {
        let doubleCurrent:Double
        
        if let current:Int16 = current
        {
             doubleCurrent = Double(current)
        }
        else
        {
            doubleCurrent = kDefaultValue
        }
        
        stepper.value = doubleCurrent
        updateLabel()
    }
}
