import UIKit

class VDrawProjectMenuSettingsTitle:UIView
{
    private weak var controller:CDrawProject!
    private weak var labelName:UILabel!
    private let kLabelLeft:CGFloat = 10
    private let kMaxWidth:CGFloat = 200
    private let kMaxHeight:CGFloat = 25
    private let kTitleMargin:CGFloat = 5
    
    init(controller:CDrawProject)
    {
        let attributesTitle:[String:AnyObject] = [
            NSFontAttributeName:UIFont.bold(size:15),
            NSForegroundColorAttributeName:UIColor.black]
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
        
        let labelTitle:UILabel = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.isUserInteractionEnabled = false
        
        let labelName:UILabel = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.backgroundColor = UIColor.clear
        labelName.isUserInteractionEnabled = false
        labelName.font = UIFont.regular(size:18)
        labelName.textColor = UIColor(white:0, alpha:0.8)
        self.labelName = labelName
        
        addSubview(labelTitle)
        addSubview(labelName)
        
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
}
