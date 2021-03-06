import UIKit

class VDrawProjectMenuSettingsZoom:UIView
{
    private weak var controller:CDrawProject!
    private weak var label:UILabel!
    private let kButtonsWidth:CGFloat = 55
    private let kButtonsHeight:CGFloat = 60
    private let kLabelTop:CGFloat = -12
    private let kLabelHeight:CGFloat = 18
    private let kIconHeight:CGFloat = 53
    private let kZoomMultiplier:CGFloat = 100
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let icon:UIImageView = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.isUserInteractionEnabled = false
        icon.contentMode = UIViewContentMode.center
        icon.clipsToBounds = true
        icon.image = #imageLiteral(resourceName: "assetGenericZoom")
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.numeric(size:14)
        label.textColor = UIColor(white:0.6, alpha:1)
        self.label = label
        
        let buttonMinus:UIButton = UIButton()
        buttonMinus.translatesAutoresizingMaskIntoConstraints = false
        buttonMinus.setImage(
            #imageLiteral(resourceName: "assetGenericZoomMinus").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.normal)
        buttonMinus.setImage(
            #imageLiteral(resourceName: "assetGenericZoomMinus").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.highlighted)
        buttonMinus.imageView!.clipsToBounds = true
        buttonMinus.imageView!.contentMode = UIViewContentMode.center
        buttonMinus.imageView!.tintColor = UIColor.cartesianBlue
        buttonMinus.addTarget(
            self,
            action:#selector(actionMinus(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let buttonPlus:UIButton = UIButton()
        buttonPlus.translatesAutoresizingMaskIntoConstraints = false
        buttonPlus.setImage(
            #imageLiteral(resourceName: "assetGenericZoomPlus").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.normal)
        buttonPlus.setImage(
            #imageLiteral(resourceName: "assetGenericZoomPlus").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.highlighted)
        buttonPlus.imageView!.clipsToBounds = true
        buttonPlus.imageView!.contentMode = UIViewContentMode.center
        buttonPlus.imageView!.tintColor = UIColor.cartesianBlue
        buttonPlus.addTarget(
            self,
            action:#selector(actionPlus(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(icon)
        addSubview(label)
        addSubview(buttonMinus)
        addSubview(buttonPlus)
        
        NSLayoutConstraint.topToTop(
            view:icon,
            toView:self)
        NSLayoutConstraint.height(
            view:icon,
            constant:kIconHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:icon,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:label,
            toView:icon,
            constant:kLabelTop)
        NSLayoutConstraint.height(
            view:label,
            constant:kLabelHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:label,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:buttonMinus,
            toView:self)
        NSLayoutConstraint.height(
            view:buttonMinus,
            constant:kButtonsHeight)
        NSLayoutConstraint.width(
            view:buttonMinus,
            constant:kButtonsWidth)
        NSLayoutConstraint.leftToLeft(
            view:buttonMinus,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:buttonPlus,
            toView:self)
        NSLayoutConstraint.height(
            view:buttonPlus,
            constant:kButtonsHeight)
        NSLayoutConstraint.width(
            view:buttonPlus,
            constant:kButtonsWidth)
        NSLayoutConstraint.rightToRight(
            view:buttonPlus,
            toView:self)
        
        printZoom()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionMinus(sender button:UIButton)
    {
        if controller.modelZoom.currentItem > 0
        {
            controller.decreaseZoom()
            printZoom()
        }
    }
    
    func actionPlus(sender button:UIButton)
    {
        let countZooms:Int = controller.modelZoom.items.count
        
        if controller.modelZoom.currentItem < countZooms - 1
        {
            controller.increaseZoom()
            printZoom()
        }
    }
    
    //MARK: private
    
    private func printZoom()
    {
        let currentZoom:CGFloat = controller.modelZoom.currentZoom()
        let zoomMultiplied:Int = Int(currentZoom * kZoomMultiplier)
        let zoomMultipliedNumber:NSNumber = zoomMultiplied as NSNumber
        let zoomString:String = String(
            format:NSLocalizedString("VDrawProjectMenuSettingsZoom_label", comment:""),
            zoomMultipliedNumber)
        label.text = zoomString
    }
}
