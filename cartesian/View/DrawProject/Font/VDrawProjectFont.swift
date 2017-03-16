import UIKit

class VDrawProjectFont:UIView, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    private let model:MDrawProjectMenuLabelsFont
    private let indexPath:IndexPath?
    private weak var controller:CDrawProject!
    private weak var collectionView:VCollection!
    private(set) weak var viewBar:VDrawProjectFontBar!
    private weak var blurContainer:UIView!
    private weak var layoutBaseTop:NSLayoutConstraint!
    private weak var delegate:MDrawProjectFontDelegate?
    private let kBaseHeight:CGFloat = 300
    private let kBarHeight:CGFloat = 50
    private let kAnimationDuration:TimeInterval = 0.3
    private let kCellHeight:CGFloat = 95
    
    init(
        controller:CDrawProject,
        delegate:MDrawProjectFontDelegate)
    {
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
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(cell:VDrawProjectFontCell.self)
        self.collectionView = collectionView
        
        baseView.addSubview(viewBar)
        baseView.addSubview(collectionView)
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
        
        NSLayoutConstraint.topToBottom(
            view:collectionView,
            toView:viewBar)
        NSLayoutConstraint.bottomToBottom(
            view:collectionView,
            toView:baseView)
        NSLayoutConstraint.equalsHorizontal(
            view:collectionView,
            toView:baseView)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        collectionView.collectionViewLayout.invalidateLayout()
        
        super.layoutSubviews()
    }
    
    //MARK: actions
    
    func actionClose(sender button:UIButton)
    {
        animateClose()
    }
    
    //MARK: private
    
    private func modelAtIndex(index:IndexPath) -> MDrawProjectMenuLabelsFontItem
    {
        let item:MDrawProjectMenuLabelsFontItem = model.items[index.item]
        
        return item
    }
    
    private func animateClose()
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
    
    //MARK: public
    
    func fontSelected()
    {
        animateClose()
        
        guard
            
            let item:MDrawProjectMenuLabelsFontItem = model.currentFont
        
        else
        {
            return
        }
        
        delegate?.fontSelected(model:item)
    }
    
    func animateShow()
    {
        layoutBaseTop.constant = -kBaseHeight
        
        UIView.animate(
            withDuration:kAnimationDuration,
            animations:
        { [weak self] in
            
            self?.blurContainer.alpha = 0.95
            self?.layoutIfNeeded()
            
        })
        { [weak self] (done:Bool) in
            
            guard
            
                let indexPath:IndexPath = self?.indexPath
            
            else
            {
                return
            }
            
            self?.collectionView.selectItem(
                at:indexPath,
                animated:true,
                scrollPosition:UICollectionViewScrollPosition.top)
        }
    }
    
    //MARK: collectionView delegate
    
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        let width:CGFloat = collectionView.bounds.maxX
        let size:CGSize = CGSize(width:width, height:kCellHeight)
        
        return size
    }
    
    func numberOfSections(in collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = model.items.count
        
        return count
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MDrawProjectMenuLabelsFontItem = modelAtIndex(index:indexPath)
        let cell:VDrawProjectFontCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            VDrawProjectFontCell.reusableIdentifier,
            for:indexPath) as! VDrawProjectFontCell
        cell.config(
            controller:controller,
            model:item)
        
        return cell
    }
    
    func collectionView(_ collectionView:UICollectionView, didSelectItemAt indexPath:IndexPath)
    {
        let item:MDrawProjectMenuLabelsFontItem = modelAtIndex(index:indexPath)
        model.currentFont = item
        
        collectionView.scrollToItem(
            at:indexPath,
            at:UICollectionViewScrollPosition.top,
            animated:true)
    }
}
