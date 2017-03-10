import UIKit

class VDrawProjectMenuNodes:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private let model:MDrawProjectMenuNodes
    private weak var controller:CDrawProject!
    private weak var collectionView:VCollection!
    private let kRows:CGFloat = 2
    private let kDeselectTime:TimeInterval = 0.2
    
    init(controller:CDrawProject)
    {
        model = MDrawProjectMenuNodes()
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let collectionView:VCollection = VCollection()
        collectionView.alwaysBounceHorizontal = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerCell(cell:VDrawProjectMenuNodesCell.self)
        self.collectionView = collectionView
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.scrollDirection = UICollectionViewScrollDirection.horizontal
        }
        
        addSubview(collectionView)
        
        NSLayoutConstraint.equals(
            view:collectionView,
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
            let height:CGFloat = bounds.maxY
            let cellSide:CGFloat = height / kRows
            let cellSize:CGSize = CGSize(width:cellSide, height:cellSide)
            flow.itemSize = cellSize
        }
        
        super.layoutSubviews()
    }
    
    //MARK: private
    
    private func modelAtIndex(index:IndexPath) -> MDrawProjectMenuNodesItem
    {
        let item:MDrawProjectMenuNodesItem = model.items[index.item]
        
        return item
    }
    
    //MARK: collectionView delegate
    
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
        let item:MDrawProjectMenuNodesItem = modelAtIndex(index:indexPath)
        let cell:VDrawProjectMenuNodesCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            VDrawProjectMenuNodesCell.reusableIdentifier,
            for:indexPath) as! VDrawProjectMenuNodesCell
        cell.config(model:item)
        
        return cell
    }
    
    func collectionView(_ collectionView:UICollectionView, didSelectItemAt indexPath:IndexPath)
    {
        collectionView.isUserInteractionEnabled = false
        
        let item:MDrawProjectMenuNodesItem = modelAtIndex(index:indexPath)
        
        DispatchQueue.main.asyncAfter(
            deadline:DispatchTime.now() + kDeselectTime)
        { [weak collectionView] in

            collectionView?.selectItem(
                at:nil,
                animated:true,
                scrollPosition:UICollectionViewScrollPosition())
            collectionView?.isUserInteractionEnabled = true
        }
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.controller.addNode(
                entityName:item.entityName)
        }
    }
}
