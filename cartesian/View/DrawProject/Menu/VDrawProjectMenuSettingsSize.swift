import UIKit

class VDrawProjectMenuSettingsSize:UIView
{
    private weak var controller:CDrawProject!
    private weak var labelWidth:UILabel!
    private weak var labelHeight:UILabel!
    private let kIconSize:CGFloat = 30
    private let kLabelsHeight:CGFloat = 17
    private let kLabelsWidth:CGFloat = 80
    private let kLabelWidthLeft:CGFloat = 4
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        self.controller = controller
        
        let font:UIFont = UIFont.numeric(size:14)
        let color:UIColor = UIColor.black
        
        let icon:UIImageView = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.isUserInteractionEnabled = false
        icon.image = #imageLiteral(resourceName: "assetGenericSize")
        icon.contentMode = UIViewContentMode.center
        icon.clipsToBounds = true
        
        let labelWidth:UILabel = UILabel()
        labelWidth.translatesAutoresizingMaskIntoConstraints = false
        labelWidth.isUserInteractionEnabled = false
        labelWidth.backgroundColor = UIColor.clear
        labelWidth.font = font
        labelWidth.textColor = color
        self.labelWidth = labelWidth
        
        let labelHeight:UILabel = UILabel()
        labelHeight.translatesAutoresizingMaskIntoConstraints = false
        labelHeight.isUserInteractionEnabled = false
        labelHeight.backgroundColor = UIColor.clear
        labelHeight.font = font
        labelHeight.textColor = color
        self.labelHeight = labelHeight
        
        addSubview(icon)
        addSubview(labelWidth)
        addSubview(labelHeight)
        
        NSLayoutConstraint.topToTop(
            view:icon,
            toView:self)
        NSLayoutConstraint.size(
            view:icon,
            constant:kIconSize)
        NSLayoutConstraint.leftToLeft(
            view:icon,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:labelWidth,
            toView:self)
        NSLayoutConstraint.height(
            view:labelWidth,
            constant:kLabelsHeight)
        NSLayoutConstraint.leftToRight(
            view:labelWidth,
            toView:icon,
            constant:kLabelWidthLeft)
        NSLayoutConstraint.width(
            view:labelWidth,
            constant:kLabelsWidth)
        
        NSLayoutConstraint.topToBottom(
            view:labelHeight,
            toView:icon)
        NSLayoutConstraint.height(
            view:labelHeight,
            constant:kLabelsHeight)
        NSLayoutConstraint.leftToLeft(
            view:labelHeight,
            toView:self)
        NSLayoutConstraint.width(
            view:labelHeight,
            constant:kLabelsWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: public
    
    func update()
    {
        let scrollSize:CGSize = controller.viewProject.viewScroll.contentSize
        let scrollWidth:NSNumber = scrollSize.width as NSNumber
        let scrollHeight:NSNumber = scrollSize.height as NSNumber
        let stringWidth:String = String(
            format:NSLocalizedString("VDrawProjectMenuSettingsSize_labels", comment:""),
            scrollWidth)
        let stringHeight:String = String(
            format:NSLocalizedString("VDrawProjectMenuSettingsSize_labels", comment:""),
            scrollHeight)
        
        labelWidth.text = stringWidth
        labelHeight.text = stringHeight
    }
}
