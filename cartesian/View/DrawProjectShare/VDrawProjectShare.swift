import UIKit

class VDrawProjectShare:VView
{
    private weak var controller:CDrawProjectShare!
    private weak var viewSpinner:VSpinner?
    private weak var viewImage:VDrawProjectShareImage!
    private weak var buttonShare:UIButton!
    private weak var layoutButtonCloseLeft:NSLayoutConstraint!
    private weak var layoutButtonShareLeft:NSLayoutConstraint!
    private let kButtonCloseWidth:CGFloat = 100
    private let kButtonCloseHeight:CGFloat = 32
    private let kButtonCloseBottom:CGFloat = -20
    private let kButtonShareSize:CGFloat = 50
    private let kButtonShareBottom:CGFloat = -10
    
    override init(controller:CController)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.clear
        self.controller = controller as? CDrawProjectShare
        
        let blur:VBlur = VBlur.extraLight()
        
        let buttonClose:UIButton = UIButton()
        buttonClose.translatesAutoresizingMaskIntoConstraints = false
        buttonClose.backgroundColor = UIColor.cartesianOrange
        buttonClose.clipsToBounds = true
        buttonClose.setTitleColor(
            UIColor.white,
            for:UIControlState.normal)
        buttonClose.setTitleColor(
            UIColor(white:1, alpha:0.2),
            for:UIControlState.highlighted)
        buttonClose.setTitle(
            NSLocalizedString("VDrawProjectShare_buttonClose", comment:""),
            for:UIControlState.normal)
        buttonClose.titleLabel!.font = UIFont.bold(size:15)
        buttonClose.layer.cornerRadius = kButtonCloseHeight / 2.0
        buttonClose.addTarget(
            self,
            action:#selector(actionClose(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let buttonShare:UIButton = UIButton()
        buttonShare.translatesAutoresizingMaskIntoConstraints = false
        buttonShare.setImage(
            #imageLiteral(resourceName: "assetGenericShare").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.normal)
        buttonShare.setImage(
            #imageLiteral(resourceName: "assetGenericShare").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.highlighted)
        buttonShare.imageView!.tintColor = UIColor(white:0, alpha:0.2)
        buttonShare.imageView!.clipsToBounds = true
        buttonShare.imageView!.contentMode = UIViewContentMode.center
        self.buttonShare = buttonShare
        
        let viewImage:VDrawProjectShareImage = VDrawProjectShareImage(
            controller:self.controller)
        self.viewImage = viewImage
        
        addSubview(blur)
        addSubview(viewImage)
        addSubview(buttonShare)
        addSubview(buttonClose)
        
        NSLayoutConstraint.equals(
            view:blur,
            toView:self)
        
        NSLayoutConstraint.height(
            view:buttonClose,
            constant:kButtonCloseHeight)
        NSLayoutConstraint.bottomToBottom(
            view:buttonClose,
            toView:self,
            constant:kButtonCloseBottom)
        NSLayoutConstraint.width(
            view:buttonClose,
            constant:kButtonCloseWidth)
        layoutButtonCloseLeft = NSLayoutConstraint.leftToLeft(
            view:buttonClose,
            toView:self)
        
        NSLayoutConstraint.size(
            view:buttonShare,
            constant:kButtonShareSize)
        NSLayoutConstraint.bottomToTop(
            view:buttonShare,
            toView:buttonClose,
            constant:kButtonShareBottom)
        layoutButtonShareLeft = NSLayoutConstraint.leftToLeft(
            view:buttonShare,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.maxX
        let remainButtonClose:CGFloat = width - kButtonCloseWidth
        let remainButtonShare:CGFloat = width - kButtonShareSize
        let buttonCloseLeft:CGFloat = remainButtonClose / 2.0
        let buttonShareLeft:CGFloat = remainButtonShare / 2.0
        layoutButtonCloseLeft.constant = buttonCloseLeft
        layoutButtonShareLeft.constant = buttonShareLeft
        
        super.layoutSubviews()
    }
    
    //MARK: actions
    
    func actionClose(sender button:UIButton)
    {
        controller.close()
    }
    
    //MARK: public
    
    func viewDidAppear()
    {
        self.viewSpinner?.stopAnimating()
        self.viewSpinner?.removeFromSuperview()
        
        let viewSpinner:VSpinner = VSpinner()
        self.viewSpinner = viewSpinner
        
        addSubview(viewSpinner)
        
        NSLayoutConstraint.equals(
            view:viewSpinner,
            toView:self)
    }
}
