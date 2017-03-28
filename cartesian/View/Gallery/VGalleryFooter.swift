import UIKit

class VGalleryFooter:UICollectionReusableView
{
    private let kBorderHeight:CGFloat = 1
    private(set) weak var buttonShare:UIButton!
    private(set) weak var controller:CGallery?
    private(set) weak var model:MGalleryItem?
    let kButtonWidth:CGFloat = 60
    let kButtonHeight:CGFloat = 40
    let kButtonTop:CGFloat = 2
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let border:VBorder = VBorder(color:UIColor(white:0, alpha:0.1))
        
        let buttonShare:UIButton = UIButton()
        buttonShare.translatesAutoresizingMaskIntoConstraints = false
        buttonShare.setImage(
            #imageLiteral(resourceName: "assetGenericShareSimple").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.normal)
        buttonShare.setImage(
            #imageLiteral(resourceName: "assetGenericShareSimple").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.highlighted)
        buttonShare.imageView!.clipsToBounds = true
        buttonShare.imageView!.contentMode = UIViewContentMode.center
        buttonShare.imageView!.tintColor = UIColor(white:0, alpha:0.1)
        self.buttonShare = buttonShare
        
        addSubview(border)
        addSubview(buttonShare)
        
        NSLayoutConstraint.topToTop(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:buttonShare,
            toView:self,
            constant:kButtonTop)
        NSLayoutConstraint.height(
            view:buttonShare,
            constant:kButtonHeight)
        NSLayoutConstraint.leftToLeft(
            view:buttonShare,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonShare,
            constant:kButtonWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionShare(sender button:UIButton)
    {
        guard
            
            let model:MGalleryItem = self.model
        
        else
        {
            return
        }
        
        controller?.shareItem(model:model)
    }
    
    //MARK: public
    
    func config(controller:CGallery, model:MGalleryItem)
    {
        self.controller = controller
        self.model = model
    }
}
