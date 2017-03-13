import UIKit

class VDrawProjectMenuBarText:UIView
{
    private weak var controller:CDrawProject!
    private weak var viewBase:UIView!
    private let kBorderWidth:CGFloat = 1
    weak var layoutBaseTop:NSLayoutConstraint!
    weak var layoutBaseWidth:NSLayoutConstraint!
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.white
        layer.borderWidth = kBorderWidth
        layer.borderColor = UIColor(white:0, alpha:0.1).cgColor
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
