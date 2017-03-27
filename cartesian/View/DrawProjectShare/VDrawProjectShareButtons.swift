import UIKit

class VDrawProjectShareButtons:UIView
{
    private weak var controller:CDrawProjectShare!
    private weak var buttonLeft:UIButton!
    private weak var buttonRightUpdate:UIButton!
    private weak var buttonRightPost:UIButton!
    private let kButtonRightWidth:CGFloat = 190
    private let kCornerRadius:CGFloat = 10
    private let kBorderWidth:CGFloat = 1
    
    init(controller:CDrawProjectShare)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.cartesianBlue
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = kCornerRadius
        self.controller = controller
        
        let buttonLeft:UIButton = UIButton()
        buttonLeft.translatesAutoresizingMaskIntoConstraints = false
        buttonLeft.setTitle(
            NSLocalizedString("VDrawProjectShareButtons_buttonLeft", comment:""),
            for:UIControlState.normal)
        buttonLeft.setTitleColor(
            UIColor.white,
            for:UIControlState.normal)
        buttonLeft.setTitleColor(
            UIColor(white:1, alpha:0.2),
            for:UIControlState.highlighted)
        buttonLeft.titleLabel!.font = UIFont.bolder(size:14)
        buttonLeft.addTarget(
            self,
            action:#selector(actionShare(sender:)),
            for:UIControlEvents.touchUpInside)
        self.buttonLeft = buttonLeft
        
        let buttonRightPost:UIButton = UIButton()
        buttonRightPost.isHidden = true
        buttonRightPost.translatesAutoresizingMaskIntoConstraints = false
        buttonRightPost.setTitle(
            NSLocalizedString("VDrawProjectShareButtons_buttonRightPost", comment:""),
            for:UIControlState.normal)
        buttonRightPost.setTitleColor(
            UIColor.white,
            for:UIControlState.normal)
        buttonRightPost.setTitleColor(
            UIColor(white:1, alpha:0.2),
            for:UIControlState.highlighted)
        buttonRightPost.titleLabel!.font = UIFont.bolder(size:14)
        buttonRightPost.addTarget(
            self,
            action:#selector(actionPost(sender:)),
            for:UIControlEvents.touchUpInside)
        self.buttonRightPost = buttonRightPost
        
        let buttonRightUpdate:UIButton = UIButton()
        buttonRightUpdate.isHidden = true
        buttonRightUpdate.translatesAutoresizingMaskIntoConstraints = false
        buttonRightUpdate.setTitle(
            NSLocalizedString("VDrawProjectShareButtons_buttonRightUpdate", comment:""),
            for:UIControlState.normal)
        buttonRightUpdate.setTitleColor(
            UIColor.white,
            for:UIControlState.normal)
        buttonRightUpdate.setTitleColor(
            UIColor(white:1, alpha:0.2),
            for:UIControlState.highlighted)
        buttonRightUpdate.titleLabel!.font = UIFont.bolder(size:14)
        buttonRightUpdate.addTarget(
            self,
            action:#selector(actionUpdate(sender:)),
            for:UIControlEvents.touchUpInside)
        self.buttonRightUpdate = buttonRightUpdate
        
        let border:VBorder = VBorder(color:UIColor.white)
        
        addSubview(border)
        addSubview(buttonLeft)
        addSubview(buttonRightPost)
        addSubview(buttonRightUpdate)
        
        NSLayoutConstraint.equalsVertical(
            view:buttonLeft,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:buttonLeft,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:buttonLeft,
            toView:self,
            constant:-kButtonRightWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:buttonRightPost,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:buttonRightPost,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonRightPost,
            constant:kButtonRightWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:buttonRightUpdate,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:buttonRightUpdate,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonRightUpdate,
            constant:kButtonRightWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:border,
            toView:self)
        NSLayoutConstraint.leftToRight(
            view:border,
            toView:buttonLeft)
        NSLayoutConstraint.width(
            view:border,
            constant:kBorderWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionShare(sender button:UIButton)
    {
        controller.exportImage()
    }
    
    func actionPost(sender button:UIButton)
    {
        controller.postImage()
    }
    
    func actionUpdate(sender button:UIButton)
    {
        controller.updateImage()
    }
    
    //MARK: public
    
    func updateButtons()
    {
        var shouldPost:Bool = false
        
        if let postEnable:Bool = MSession.sharedInstance.settings?.shouldPost
        {
            shouldPost = postEnable
        }
        
        if shouldPost
        {
            if let _:String = controller.model.sharedId
            {
                buttonRightPost.isHidden = true
                buttonRightUpdate.isHidden = false
            }
            else
            {
                buttonRightPost.isHidden = false
                buttonRightUpdate.isHidden = true
            }
        }
        else
        {
            buttonRightPost.isHidden = true
            buttonRightUpdate.isHidden = true
        }
    }
}
