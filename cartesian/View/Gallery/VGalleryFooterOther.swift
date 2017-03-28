import UIKit

class VGalleryFooterOther:VGalleryFooter
{
    private weak var buttonLike:UIButton!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let buttonLike:UIButton = UIButton()
        buttonLike.translatesAutoresizingMaskIntoConstraints = false
        buttonLike.addTarget(
            self,
            action:#selector(actionLike(sender:)),
            for:UIControlEvents.touchUpInside)
        self.buttonLike = buttonLike
        
        addSubview(buttonLike)
        
        NSLayoutConstraint.topToTop(
            view:buttonLike,
            toView:self,
            constant:kButtonTop)
        NSLayoutConstraint.height(
            view:buttonLike,
            constant:kButtonHeight)
        NSLayoutConstraint.leftToRight(
            view:buttonLike,
            toView:buttonShare)
        NSLayoutConstraint.width(
            view:buttonLike,
            constant:kButtonWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func config(controller:CGallery, model:MGalleryItem)
    {
        super.config(controller:controller, model:model)
        updateLike()
    }
    
    //MARK: actions
    
    func actionLike(sender button:UIButton)
    {
        
    }
    
    //MARK: private
    
    private func updateLike()
    {
        
    }
}
