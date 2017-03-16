import UIKit

class VDrawProjectFont:UIView
{
    private let model:MDrawProjectMenuLabelsFont
    private weak var controller:CDrawProject!
    private weak var collectionView:VCollection!
    private(set) weak var viewBar:VDrawProjectFontBar!
    private weak var blurContainer:UIView!
    private weak var layoutBaseTop:NSLayoutConstraint!
    private weak var delegate:MDrawProjectFontDelegate?
    private let kBaseHeight:CGFloat = 300
    private let kBarHeight:CGFloat = 50
    private let kAnimationDuration:TimeInterval = 0.3
    
    init(
        controller:CDrawProject,
        delegate:MDrawProjectFontDelegate)
    {
        let indexPath:IndexPath?
        
        if let model:MDrawProjectMenuLabelsFont = delegate.fontModel()
        {
            self.model = model
            indexPath = model.selectedIndex()
        }
        else
        {
            model = MDrawProjectMenuLabelsFont()
            
            if let stringSelected:String = delegate.fontCurrent()
            {
                indexPath = model.indexForName(name:stringSelected)
            }
            else
            {
                indexPath = nil
            }
        }
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        self.controller = controller
        self.delegate = delegate
        
        let blur:VBlur = VBlur.dark()
        
        let blurContainer:UIView = UIView()
        blurContainer.isUserInteractionEnabled = false
        blurContainer.clipsToBounds = true
        blurContainer.translatesAutoresizingMaskIntoConstraints = false
        blurContainer.alpha = 0
        self.blurContainer = blurContainer
        
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
        
        let viewBar:VDrawProjectFontBar = VDrawProjectFontBar(
            controller:controller)
        self.viewBar = viewBar
        
        let collectionView:VCollection = VCollection()
        collectionView.alwaysBounceVertical = true
        self.collectionView = collectionView
        
        baseView.addSubview(viewBar)
        blurContainer.addSubview(blur)
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
        
        layoutBaseTop = NSLayoutConstraint.topToBottom(
            view:baseView,
            toView:self)
        NSLayoutConstraint.height(
            view:baseView,
            constant:kBaseHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:baseView,
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
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
//        collectionView.collectionViewLayout.invalidateLayout()
        
        super.layoutSubviews()
    }
    
    //MARK: actions
    
    func actionClose(sender button:UIButton)
    {
        animateClose()
    }
    
    //MARK: public
    
    func animateClose()
    {
        layoutBaseTop.constant = 0
        
        UIView.animate(
            withDuration:kAnimationDuration,
            animations:
            { [weak self] in
                
                self?.alpha = 0
                self?.layoutIfNeeded()
            })
        { [weak self] (done:Bool) in
            
            self?.removeFromSuperview()
        }
    }
    
    func fontSelected(item:MDrawProjectMenuLabelsFontItem)
    {
        animateClose()
        delegate?.fontSelected(model:item)
    }
    
    func animateShow()
    {
        layoutBaseTop.constant = -kBaseHeight
        
        UIView.animate(withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.blurContainer.alpha = 0.95
            self?.layoutIfNeeded()
        }
    }
}
