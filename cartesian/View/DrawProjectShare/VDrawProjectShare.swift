import UIKit

class VDrawProjectShare:VView
{
    private weak var controller:CDrawProjectShare!
    private weak var viewSpinner:VSpinner?
    private weak var viewImage:VDrawProjectShareImage!
    private weak var shareButtons:VDrawProjectShareButtons!
    private weak var layoutButtonCloseLeft:NSLayoutConstraint!
    private weak var layoutButtonsShareLeft:NSLayoutConstraint!
    private let kButtonCloseWidth:CGFloat = 100
    private let kButtonCloseHeight:CGFloat = 32
    private let kButtonCloseBottom:CGFloat = -20
    private let kButtonsShareHeight:CGFloat = 34
    private let kButtonsShareWidth:CGFloat = 300
    private let kButtonsShareBottom:CGFloat = -20
    private let kImageBottom:CGFloat = -20
    
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
        
        let shareButtons:VDrawProjectShareButtons = VDrawProjectShareButtons(
            controller:self.controller)
        shareButtons.isHidden = true
        self.shareButtons = shareButtons
        
        let viewImage:VDrawProjectShareImage = VDrawProjectShareImage(
            controller:self.controller)
        viewImage.isHidden = true
        self.viewImage = viewImage
        
        let viewSpinner:VSpinner = VSpinner()
        self.viewSpinner = viewSpinner
        
        addSubview(blur)
        addSubview(viewImage)
        addSubview(shareButtons)
        addSubview(buttonClose)
        addSubview(viewSpinner)
        
        NSLayoutConstraint.equals(
            view:viewSpinner,
            toView:self)
        
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
        
        NSLayoutConstraint.topToTop(
            view:viewImage,
            toView:self)
        NSLayoutConstraint.bottomToTop(
            view:viewImage,
            toView:shareButtons,
            constant:kImageBottom)
        NSLayoutConstraint.equalsHorizontal(
            view:viewImage,
            toView:self)
        
        NSLayoutConstraint.bottomToTop(
            view:shareButtons,
            toView:buttonClose,
            constant:kButtonsShareBottom)
        NSLayoutConstraint.height(
            view:shareButtons,
            constant:kButtonsShareHeight)
        layoutButtonsShareLeft = NSLayoutConstraint.leftToLeft(
            view:shareButtons,
            toView:self)
        NSLayoutConstraint.width(
            view:shareButtons,
            constant:kButtonsShareWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.maxX
        let remainButtonClose:CGFloat = width - kButtonCloseWidth
        let remainButtonsShare:CGFloat = width - kButtonsShareWidth
        let buttonCloseLeft:CGFloat = remainButtonClose / 2.0
        let buttonsShareLeft:CGFloat = remainButtonsShare / 2.0
        layoutButtonCloseLeft.constant = buttonCloseLeft
        layoutButtonsShareLeft.constant = buttonsShareLeft
        
        super.layoutSubviews()
    }
    
    //MARK: actions
    
    func actionClose(sender button:UIButton)
    {
        controller.close()
    }
    
    func actionShare(sender button:UIButton)
    {
        controller.exportImage()
    }
    
    //MARK: public
    
    func imageRendered()
    {
        viewSpinner?.stopAnimating()
        viewSpinner?.removeFromSuperview()
        
        shareButtons.isHidden = false
        viewImage.isHidden = false
        viewImage.refresh()
    }
}
