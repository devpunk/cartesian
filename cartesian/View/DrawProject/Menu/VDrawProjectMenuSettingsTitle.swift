import UIKit

class VDrawProjectMenuSettingsTitle:UIView
{
    private weak var controller:CDrawProject!
    private weak var labelName:UILabel!
    private let kLabelLeft:CGFloat = 10
    private let kMaxWidth:CGFloat = 200
    private let kMaxHeight:CGFloat = 25
    private let kTitleMargin:CGFloat = 5
    private let kBorderHeight:CGFloat = 1
    
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
        labelName.font = UIFont.regular(size:14)
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
    
    //MARK: public
    
    func updateTitle()
    {
        labelName.text = controller.model?.projectName()
    }
}
