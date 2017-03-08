import UIKit

class VDrawProjectSize:UIView
{
    private(set) weak var viewBar:VDrawProjectSizeBar!
    private weak var controller:CDrawProject!
    private weak var delegate:MDrawProjectSizeDelegate?
    private weak var blurContainer:UIView!
    private weak var viewWidth:VDrawProjectSizeDimension!
    private weak var viewHeight:VDrawProjectSizeDimension!
    private weak var layoutBaseTop:NSLayoutConstraint!
    private let kBarHeight:CGFloat = 60
    private let kBaseHeight:CGFloat = 230
    private let kDimensionWidth:CGFloat = 150
    private let kAnimationDuration:TimeInterval = 0.3
    
    init(controller:CDrawProject, delegate:MDrawProjectSizeDelegate)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        self.delegate = delegate
        
        let blurContainer:UIView = UIView()
        blurContainer.isUserInteractionEnabled = false
        blurContainer.clipsToBounds = true
        blurContainer.translatesAutoresizingMaskIntoConstraints = false
        blurContainer.alpha = 0
        self.blurContainer = blurContainer
        
        let blur:VBlur = VBlur.dark()
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.clear
        button.addTarget(
            self,
            action:#selector(actionClose(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let baseView:UIView = UIView()
        baseView.translatesAutoresizingMaskIntoConstraints = false
        baseView.clipsToBounds = true
        baseView.backgroundColor = UIColor.white
        
        let viewBar:VDrawProjectSizeBar = VDrawProjectSizeBar(
            controller:controller)
        self.viewBar = viewBar
        
        let viewWidth:VDrawProjectSizeDimension = VDrawProjectSizeDimension(
            title:"width",
            originalSize:100)
        self.viewWidth = viewWidth
        
        let viewHeight:VDrawProjectSizeDimension = VDrawProjectSizeDimension(
            title:"height",
            originalSize:100)
        self.viewHeight = viewHeight
        
        blurContainer.addSubview(blur)
        baseView.addSubview(viewBar)
        baseView.addSubview(viewWidth)
        baseView.addSubview(viewHeight)
        addSubview(blurContainer)
        addSubview(button)
        addSubview(baseView)
        
        NSLayoutConstraint.equals(
            view:blur,
            toView:blurContainer)
        
        NSLayoutConstraint.equals(
            view:blurContainer,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:button,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:baseView)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:kBarHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:baseView)
        
        layoutBaseTop = NSLayoutConstraint.topToTop(
            view:baseView,
            toView:self,
            constant:-kBaseHeight)
        NSLayoutConstraint.height(
            view:baseView,
            constant:kBaseHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:baseView,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:viewWidth,
            toView:viewBar)
        NSLayoutConstraint.bottomToBottom(
            view:viewWidth,
            toView:baseView)
        NSLayoutConstraint.leftToLeft(
            view:viewWidth,
            toView:self)
        NSLayoutConstraint.width(
            view:viewWidth,
            constant:kDimensionWidth)
        
        NSLayoutConstraint.topToBottom(
            view:viewHeight,
            toView:viewBar)
        NSLayoutConstraint.bottomToBottom(
            view:viewHeight,
            toView:viewBar)
        NSLayoutConstraint.leftToRight(
            view:viewHeight,
            toView:viewWidth)
        NSLayoutConstraint.width(
            view:viewHeight,
            constant:kDimensionWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionClose(sender button:UIButton)
    {
        animateClose()
    }
    
    //MARK: public
    
    func animateClose()
    {
        UIView.animate(
            withDuration:kAnimationDuration,
            animations:
            { [weak self] in
                
                self?.alpha = 0
            })
        { [weak self] (done:Bool) in
            
            self?.removeFromSuperview()
        }
    }
    
    func animateShow()
    {
        layoutBaseTop.constant = 0
        
        UIView.animate(withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.blurContainer.alpha = 0.95
            self?.layoutIfNeeded()
        }
    }
}
