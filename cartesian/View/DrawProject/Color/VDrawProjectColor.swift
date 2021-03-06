import UIKit

class VDrawProjectColor:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private(set) weak var viewBar:VDrawProjectColorBar!
    private weak var controller:CDrawProject!
    private weak var delegate:MDrawProjectColorDelegate?
    private weak var collectionView:VCollection!
    private weak var blurContainer:UIView!
    private weak var layoutBaseTop:NSLayoutConstraint!
    private let kInterItem:CGFloat = 18
    private let kBarHeight:CGFloat = 60
    private let kBaseHeight:CGFloat = 210
    private let kRows:CGFloat = 3
    private let kAnimationDuration:TimeInterval = 0.3
    
    init(controller:CDrawProject, delegate:MDrawProjectColorDelegate)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        self.delegate = delegate
        
        let blurContainer:UIView = UIView()
        blurContainer.isUserInteractionEnabled = false
        blurContainer.translatesAutoresizingMaskIntoConstraints = false
        blurContainer.clipsToBounds = true
        blurContainer.alpha = 0
        self.blurContainer = blurContainer
        
        let blur:VBlur = VBlur.dark()
        
        let baseView:UIView = UIView()
        baseView.translatesAutoresizingMaskIntoConstraints = false
        baseView.clipsToBounds = true
        baseView.backgroundColor = UIColor.white
        
        let viewBar:VDrawProjectColorBar = VDrawProjectColorBar(
            controller:controller)
        self.viewBar = viewBar
        
        let collectionView:VCollection = VCollection()
        collectionView.alwaysBounceHorizontal = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerCell(cell:VDrawProjectColorCell.self)
        self.collectionView = collectionView
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            let collectionHeight:CGFloat = kBaseHeight - kBarHeight
            let interItems:CGFloat = kInterItem * (kRows + 1)
            let collectionRemain:CGFloat = collectionHeight - interItems
            let cellSide:CGFloat = collectionRemain / kRows
            flow.minimumInteritemSpacing = kInterItem
            flow.minimumLineSpacing = kInterItem
            flow.itemSize = CGSize(width:cellSide, height:cellSide)
            flow.scrollDirection = UICollectionViewScrollDirection.horizontal
            flow.sectionInset = UIEdgeInsets(
                top:kInterItem,
                left:kInterItem,
                bottom:kInterItem,
                right:kInterItem)
        }
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(
            self,
            action:#selector(actionClose(sender:)),
            for:UIControlEvents.touchUpInside)
        
        blurContainer.addSubview(blur)
        baseView.addSubview(collectionView)
        baseView.addSubview(viewBar)
        addSubview(blurContainer)
        addSubview(button)
        addSubview(baseView)
        
        NSLayoutConstraint.equals(
            view:blurContainer,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:blur,
            toView:blurContainer)
        
        NSLayoutConstraint.equals(
            view:button,
            toView:self)
        
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
    
    //MARK: actions
    
    func actionClose(sender button:UIButton)
    {
        animateClose()
    }
    
    //MARK: private
    
    private func modelAtIndex(index:IndexPath) -> MDrawProjectColorItem
    {
        let item:MDrawProjectColorItem = controller.modelColor.items[index.item]
        
        return item
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
    
    //MARK: collectionView delegate
    
    func numberOfSections(in collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = controller.modelColor.items.count
        
        return count
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MDrawProjectColorItem = modelAtIndex(index:indexPath)
        let cell:VDrawProjectColorCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            VDrawProjectColorCell.reusableIdentifier,
            for:indexPath) as! VDrawProjectColorCell
        cell.config(model:item)
        
        return cell
    }
    
    func collectionView(_ collectionView:UICollectionView, didSelectItemAt indexPath:IndexPath)
    {
        let indexSelected:Int = indexPath.item
        delegate?.colorSelected(index:indexSelected)
        
        animateClose()
    }
}
