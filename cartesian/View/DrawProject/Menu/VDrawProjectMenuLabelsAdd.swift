import UIKit

class VDrawProjectMenuLabelsAdd:UIButton, UITextFieldDelegate
{
    private weak var controller:CDrawProject!
    private let kIconLeft:CGFloat = 4
    private let kIconWidth:CGFloat = 27
    private let kAlphaSelected:CGFloat = 0.2
    private let kAlphaNotSelected:CGFloat = 1
    private let kEmpty:String = ""
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(
            self,
            action:#selector(actionButton(sender:)),
            for:UIControlEvents.touchUpInside)
        self.controller = controller
        
        let icon:UIImageView = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.isUserInteractionEnabled = false
        icon.clipsToBounds = true
        icon.image = #imageLiteral(resourceName: "assetGenericAddSimple")
        icon.contentMode = UIViewContentMode.center
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.font = UIFont.bold(size:15)
        label.textColor = UIColor.black
        label.text = NSLocalizedString("VDrawProjectMenuLabelsAdd_label", comment:"")
        
        addSubview(icon)
        addSubview(label)
        
        NSLayoutConstraint.equalsVertical(
            view:icon,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:icon,
            toView:self,
            constant:kIconLeft)
        NSLayoutConstraint.width(
            view:icon,
            constant:kIconWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:label,
            toView:self)
        NSLayoutConstraint.leftToRight(
            view:label,
            toView:icon)
        NSLayoutConstraint.rightToRight(
            view:label,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override var isSelected:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    override var isHighlighted:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    //MARK: actions
    
    func actionButton(sender button:UIButton)
    {
        controller.startText(delegate:self)
    }
    
    //MARK: private
    
    private func hover()
    {
        if isSelected || isHighlighted
        {
            alpha = kAlphaSelected
        }
        else
        {
            alpha = kAlphaNotSelected
        }
    }
    
    //MARK: textField delegate
    
    func textFieldDidBeginEditing(_ textField:UITextField)
    {
        textField.text = kEmpty
    }
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool
    {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField:UITextField)
    {
        guard
            
            let text:String = textField.text,
            let fontName:String = controller.viewProject.viewMenu.viewLabels.viewFontName.model.currentFont?.currentType
            
        else
        {
            return
        }
        
        let fontColor:UIColor = UIColor.black
        let fontSize:Double = controller.viewProject.viewMenu.viewLabels.viewFontSize.stepper.value
        let intFontSize:Int16 = Int16(fontSize)
        
        controller.endText()
        controller.addLabel(
            text:text,
            fontName:fontName,
            fontSize:intFontSize,
            color:fontColor)
    }
}
