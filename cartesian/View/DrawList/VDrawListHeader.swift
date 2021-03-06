import UIKit

class VDrawListHeader:UICollectionReusableView
{
    private weak var controller:CDrawList?
    private weak var layoutButtonLeft:NSLayoutConstraint!
    private let kButtonSize:CGFloat = 40
    private let kButtonBottom:CGFloat = -25
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(
            #imageLiteral(resourceName: "assetGenericAdd").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.normal)
        button.setImage(
            #imageLiteral(resourceName: "assetGenericAdd").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.highlighted)
        button.imageView!.clipsToBounds = true
        button.imageView!.contentMode = UIViewContentMode.center
        button.imageView!.tintColor = UIColor(white:0, alpha:0.1)
        button.addTarget(
            self,
            action:#selector(actionButton(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(button)
        
        NSLayoutConstraint.bottomToBottom(
            view:button,
            toView:self,
            constant:kButtonBottom)
        layoutButtonLeft = NSLayoutConstraint.leftToLeft(
            view:button,
            toView:self)
        NSLayoutConstraint.size(
            view:button,
            constant:kButtonSize)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.maxX
        let remainWidth:CGFloat = width - kButtonSize
        let marginLeft:CGFloat = remainWidth / 2.0
        
        layoutButtonLeft.constant = marginLeft
    }
    
    //MARK: actions
    
    func actionButton(sender button:UIButton)
    {
        controller?.newDraw()
    }
    
    //MARK: public
    
    func config(controller:CDrawList)
    {
        self.controller = controller
    }
}
