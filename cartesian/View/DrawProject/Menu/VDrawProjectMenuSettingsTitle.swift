import UIKit

class VDrawProjectMenuSettingsTitle:UIButton, UITextFieldDelegate
{
    private weak var controller:CDrawProject!
    private weak var labelName:UILabel!
    private let kLabelLeft:CGFloat = 10
    private let kMaxWidth:CGFloat = 200
    private let kMaxHeight:CGFloat = 25
    private let kTitleMargin:CGFloat = 5
    private let kBorderHeight:CGFloat = 1
    private let kAlphaSelected:CGFloat = 0.2
    private let kAlphaNotSelected:CGFloat = 1
    
    init(controller:CDrawProject)
    {
        let attributesTitle:[String:AnyObject] = [
            NSFontAttributeName:UIFont.bold(size:14),
            NSForegroundColorAttributeName:UIColor(white:0.7, alpha:1)]
        let stringTitle:NSAttributedString = NSAttributedString(
            string:NSLocalizedString("VDrawProjectMenuSettingsTitle_labelTitle", comment:""),
            attributes:attributesTitle)
        let titleMaxSize:CGSize = CGSize(
            width:kMaxWidth,
            height:kMaxHeight)
        let drawingOptions:NSStringDrawingOptions = NSStringDrawingOptions([
            NSStringDrawingOptions.usesFontLeading,
            NSStringDrawingOptions.usesLineFragmentOrigin])
        let titleRect:CGRect = stringTitle.boundingRect(
            with:titleMaxSize,
            options:drawingOptions,
            context:nil)
        let titleWidth:CGFloat = ceil(titleRect.size.width)
        let titleWidthMargin:CGFloat = titleWidth + kTitleMargin
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(
            self,
            action:#selector(actionButton(sender:)),
            for:UIControlEvents.touchUpInside)
        self.controller = controller
        
        let border:VBorder = VBorder(color:UIColor(white:0, alpha:0.1))
        
        let labelTitle:UILabel = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.isUserInteractionEnabled = false
        labelTitle.attributedText = stringTitle
        
        let labelName:UILabel = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.backgroundColor = UIColor.clear
        labelName.isUserInteractionEnabled = false
        labelName.font = UIFont.bold(size:15)
        labelName.textColor = UIColor.black
        self.labelName = labelName
        
        addSubview(border)
        addSubview(labelTitle)
        addSubview(labelName)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.equalsVertical(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:labelTitle,
            toView:self,
            constant:kLabelLeft)
        NSLayoutConstraint.width(
            view:labelTitle,
            constant:titleWidthMargin)
        
        NSLayoutConstraint.equalsVertical(
            view:labelName,
            toView:self)
        NSLayoutConstraint.leftToRight(
            view:labelName,
            toView:labelTitle)
        NSLayoutConstraint.rightToRight(
            view:labelName,
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
    
    //MARK: public
    
    func updateTitle()
    {
        labelName.text = controller.model?.projectName()
    }
    
    //MARK: textField delegate
    
    func textFieldDidBeginEditing(_ textField:UITextField)
    {
        textField.text = controller.model?.projectName()
    }
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool
    {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField:UITextField)
    {
        guard
        
            let text:String = textField.text
        
        else
        {
            return
        }
        
        controller.model?.title = text
        DManager.sharedInstance?.save()
        
        controller.endText()
        updateTitle()
    }
}
