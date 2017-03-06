import UIKit

class VDrawProjectMenuSettingsZoom:UIView
{
    private weak var controller:CDrawProject!
    
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
        
        let buttonMinus:UIButton = UIButton()
        buttonMinus.translatesAutoresizingMaskIntoConstraints = false
        buttonMinus.imageView!.clipsToBounds = true
        buttonMinus.imageView!.contentMode = UIViewContentMode.center
        buttonMinus.imageView!.tintColor = UIColor
        
        
        let buttonPlus:UIButton = UIButton()
        
        
        addSubview(buttonMinus)
        addSubview(buttonPlus)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
