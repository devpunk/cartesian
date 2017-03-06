import UIKit

class VDrawProjectColor:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private weak var controller:CDrawProject!
    private(set) weak var viewBar:VDrawProjectColorBar!
    private weak var collectionView:VCollection!
    private let kBarHeight:CGFloat = 60
    private let kRows:CGFloat = 2
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
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
            flow.scrollDirection = UICollectionViewScrollDirection.horizontal
        }
        
        addSubview(viewBar)
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:kBarHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            let height:CGFloat = collectionView.bounds.maxY
            let cellSide:CGFloat = height / kRows
            let cellSize:CGSize = CGSize(width:cellSide, height:cellSide)
            flow.itemSize = cellSize
        }
        
        super.layoutSubviews()
    }
    
    //MARK: private
    
    private func modelAtIndex(index:IndexPath) -> MDrawProjectColorItem
    {
        let item:MDrawProjectColorItem = controller.modelColor.items[index.item]
        
        return item
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
}
