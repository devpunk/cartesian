import UIKit

class VDrawProjectMenuBarButton:UIButton
{
    init(image:UIImage)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        setImage(
            image.withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.normal)
        setImage(
            image.withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.highlighted)
        setImage(
            image.withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.selected)
        imageView!.clipsToBounds = true
        imageView!.contentMode = UIViewContentMode.center
        imageView!.tintColor = UIColor(red:0.75, green:0.8, blue:0.85, alpha:1)
        isHighlighted = false
        isSelected = false
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        return nil
    }
}
