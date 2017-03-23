import UIKit

class VSettingsCellRetina:VSettingsCell
{
    private weak var check:UISwitch!
    private let kLabelLeft:CGFloat = 10
    private let kLabelWidth:CGFloat = 210
    private let kCheckTop:CGFloat = 30
    private let kCheckHeight:CGFloat = 100
    private let kCheckWidth:CGFloat = 70
    
    override init(frame:CGRect)
    {
        let attributesTitle:[String:AnyObject] = [
            NSFontAttributeName:UIFont.bold(size:16),
            NSForegroundColorAttributeName:UIColor.black]
        let attributesSubtitle:[String:AnyObject] = [
            NSFontAttributeName:UIFont.regular(size:14),
            NSForegroundColorAttributeName:UIColor.black]
        
        let stringTitle:NSAttributedString = NSAttributedString(
            string:NSLocalizedString("VSettingsCellRetina_stringTitle", comment:""),
            attributes:attributesTitle)
        let stringSubtitle:NSAttributedString = NSAttributedString(
            string:NSLocalizedString("VSettingsCellRetina_stringSubtitle", comment:""),
            attributes:attributesSubtitle)
        let mutableString:NSMutableAttributedString = NSMutableAttributedString()
        mutableString.append(stringTitle)
        mutableString.append(stringSubtitle)
        
        super.init(frame:frame)
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.attributedText = mutableString
        
        let check:UISwitch = UISwitch()
        check.translatesAutoresizingMaskIntoConstraints = false
        check.tintColor = UIColor.black
        check.onTintColor = UIColor.cartesianOrange
        check.addTarget(
            self,
            action:#selector(actionCheck(sender:)),
            for:UIControlEvents.valueChanged)
        self.check = check
        
        addSubview(label)
        addSubview(check)
        
        NSLayoutConstraint.equalsVertical(
            view:label,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:label,
            toView:self,
            constant:kLabelLeft)
        NSLayoutConstraint.width(
            view:label,
            constant:kLabelWidth)
        
        NSLayoutConstraint.topToTop(
            view:check,
            toView:self,
            constant:kCheckTop)
        NSLayoutConstraint.height(
            view:check,
            constant:kCheckHeight)
        NSLayoutConstraint.rightToRight(
            view:check,
            toView:self)
        NSLayoutConstraint.width(
            view:check,
            constant:kCheckWidth)
        
        loadRetina()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionCheck(sender check:UISwitch)
    {
        let retina:Bool = check.isOn
     
        MSession.sharedInstance.settings?.retina = retina
        DManager.sharedInstance?.save()
    }
    
    //MARK: private
    
    private func loadRetina()
    {
        guard
        
            let retina:Bool = MSession.sharedInstance.settings?.retina
        
        else
        {
            return
        }
        
        check.isOn = retina
    }
}
