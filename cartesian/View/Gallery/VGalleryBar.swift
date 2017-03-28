import UIKit

class VGalleryBar:UIView
{
    private weak var controller:CGallery!
    private let kBorderHeight:CGFloat = 1
    
    init(controller:CGallery)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        
        let blur:VBlur = VBlur.light()
        let border:VBorder = VBorder(color:UIColor(white:0, alpha:0.1))
        
        addSubview(blur)
        addSubview(border)
        
        NSLayoutConstraint.equals(
            view:blur,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: public
    
    func refresh()
    {
        
    }
}
