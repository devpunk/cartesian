import UIKit

class VDrawProjectMenuEditBar:UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    private let model:MDrawProjectMenuEditBar
    private weak var controller:CDrawProject!
    private weak var collectionView:VCollection!
    private let kBorderHeight:CGFloat = 1
    private let kCellWidth:CGFloat = 70
    private let kDeselectTime:TimeInterval = 0.2
    
    init(controller:CDrawProject)
    {
        model = MDrawProjectMenuEditBar()
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let border:VBorder = VBorder(color:UIColor(white:0, alpha:0.1))
        
        let collectionView:VCollection = VCollection()
        collectionView.isScrollEnabled = false
        collectionView.bounces = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(cell:VDrawProjectMenuEditBarCell.self)
        self.collectionView = collectionView
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.scrollDirection = UICollectionViewScrollDirection.horizontal
        }
        
        addSubview(border)
        addSubview(collectionView)
        
        NSLayoutConstraint.topToTop(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:collectionView,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func modelAtIndex(index:IndexPath) -> MDrawProjectMenuEditBarItem
    {
        let item:MDrawProjectMenuEditBarItem = model.items[index.item]
        
        return item
    }
    
    //MARK: public
    
    func deselectItems()
    {
        collectionView.selectItem(
            at:nil,
            animated:true,
            scrollPosition:UICollectionViewScrollPosition())
    }
    
    //MARK: collectionView delegate
    
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        let height:CGFloat = collectionView.bounds.maxY
        let size:CGSize = CGSize(width:kCellWidth, height:height)
        
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
        let item:MDrawProjectMenuEditBarItem = modelAtIndex(index:indexPath)
        let cell:VDrawProjectMenuEditBarCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            VDrawProjectMenuEditBarCell.reusableIdentifier,
            for:indexPath) as! VDrawProjectMenuEditBarCell
        cell.config(model:item)
        
        return cell
    }
    
    func collectionView(_ collectionView:UICollectionView, didSelectItemAt indexPath:IndexPath)
    {
        collectionView.isUserInteractionEnabled = false
        
        let item:MDrawProjectMenuEditBarItem = modelAtIndex(index:indexPath)
        item.selected(controller:controller)
        
        DispatchQueue.main.asyncAfter(
            deadline:DispatchTime.now() + kDeselectTime)
        { [weak self, weak collectionView] in
            
            collectionView?.isUserInteractionEnabled = true
            
            if !item.keepSelected
            {
                self?.deselectItems()
            }
        }
    }
}
