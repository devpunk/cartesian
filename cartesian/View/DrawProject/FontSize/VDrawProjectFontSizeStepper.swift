import UIKit

class VDrawProjectFontSizeStepper:UIView
{
    private weak var stepper:UIStepper!
    private weak var label:UILabel!
    private let kMinValue:Double = 10
    private let kMaxValue:Double = 30
    private let kDefaultValue:Double = 16
    
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder:NSCoder)
    {
        return nil
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
    
    func updateFont(current:Int16)
    {
        let doubleCurrent:Double = Double(current)
        stepper.value = doubleCurrent
        updateLabel()
    }
}
