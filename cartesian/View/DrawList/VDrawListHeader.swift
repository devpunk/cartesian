import UIKit

class VDrawListHeader:UICollectionReusableView
{
    private weak var layoutButtonTop:NSLayoutConstraint!
    private weak var layoutButtonLeft:NSLayoutConstraint!
    private let kButtonSize:CGFloat = 40
    
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
        
        addSubview(button)
        
        layoutButtonTop = NSLayoutConstraint.topToTop(
            view:button,
            toView:self)
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
        let height:CGFloat = bounds.maxY
        let remainWidth:CGFloat = width - kButtonSize
        let remainHeight:CGFloat = height - kButtonSize
        let marginLeft:CGFloat = remainWidth / 2.0
        let marginTop:CGFloat = remainHeight / 2.0
        
        layoutButtonLeft.constant = marginLeft
        layoutButtonTop.constant = marginTop
    }
}
