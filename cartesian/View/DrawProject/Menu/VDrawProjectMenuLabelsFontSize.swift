import UIKit

class VDrawProjectMenuLabelsFontSize:UIView
{
    private weak var controller:CDrawProject!
    private weak var label:UILabel!
    private weak var stepper:UIStepper!
    private let kStepperTop:CGFloat = 10
    private let kStepperWidth:CGFloat = 70
    private let kLabelRight:CGFloat = -5
    private let kMinValue:Double = 10
    private let kMaxValue:Double = 30
    private let kDefaultValue:Double = 16
    
    init(controller:CDrawProject)
    {
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
        label.font = UIFont.numeric(size:20)
        label.textColor = UIColor.black
        self.label = label
        
        let stepper:UIStepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.tintColor = UIColor.black
        stepper.minimumValue = kMinValue
        stepper.maximumValue = kMaxValue
        stepper.value = kDefaultValue
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
        
        NSLayoutConstraint.topToTop(
            view:label,
            toView:self,
            constant:kStepperTop)
        NSLayoutConstraint.bottomToBottom(
            view:label,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:label,
            toView:self)
        NSLayoutConstraint.rightToLeft(
            view:label,
            toView:self,
            constant:kLabelRight)
        
        printLabel()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func printLabel()
    {
        let currentValue:Int = Int(stepper.value)
        let stringValue:String = "\(currentValue)"
        label.text = stringValue
    }
}
