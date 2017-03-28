import UIKit

class VGallery:VView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private weak var controller:CGallery!
    private weak var spinner:VSpinner!
    private weak var viewBar:VGalleryBar!
    private(set) weak var collectionView:VCollection!
    private let kBarTop:CGFloat = 70
    private let kBarHeight:CGFloat = 45
    private let kHeaderHeight:CGFloat = 45
    private let kFooterHeight:CGFloat = 90
    private let kCellHeight:CGFloat = 250
    
    override init(controller:CController)
    {
        super.init(controller:controller)
        self.controller = controller as? CGallery
        
        let spinner:VSpinner = VSpinner()
        self.spinner = spinner
        
        let viewBar:VGalleryBar = VGalleryBar(
            controller:self.controller)
        viewBar.isHidden = true
        self.viewBar = viewBar
        
        let collectionView:VCollection = VCollection()
        collectionView.isHidden = true
        collectionView.alwaysBounceVertical = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerHeader(header:VGalleryHeader.self)
        collectionView.registerFooter(footer:VGalleryFooterMine.self)
        collectionView.registerFooter(footer:VGalleryFooterOther.self)
        collectionView.registerCell(cell:VGalleryCell.self)
        collectionView.contentInset = UIEdgeInsets(
            top:kBarHeight,
            left:0,
            bottom:0,
            right:0)
        self.collectionView = collectionView
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.headerReferenceSize = CGSize(width:0, height:kHeaderHeight)
            flow.footerReferenceSize = CGSize(width:0, height:kFooterHeight)
        }
        
        addSubview(spinner)
        addSubview(collectionView)
        addSubview(viewBar)
        
        NSLayoutConstraint.equals(
            view:spinner,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self,
            constant:kBarTop)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:kBarHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:collectionView,
            toView:self,
            constant:kBarTop)
        NSLayoutConstraint.bottomToBottom(
            view:collectionView,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:collectionView,
            toView:self)
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
    
    //MARK: private
    
    private func modelAtIndex(index:IndexPath) -> MGalleryItem
    {
        let item:MGalleryItem = controller.model.displayItems[index.section]
        
        return item
    }
    
    //MARK: public
    
    func startLoading()
    {
        spinner.startAnimating()
        viewBar.isHidden = true
        collectionView.isHidden = true
    }
    
    func stopLoading()
    {
        spinner.stopAnimating()
        viewBar.isHidden = false
        viewBar.refresh()
        collectionView.isHidden = false
        collectionView.reloadData()
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
        let count:Int = controller.model.displayItems.count
        
        return count
    }
    
    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView:UICollectionView, viewForSupplementaryElementOfKind kind:String, at indexPath:IndexPath) -> UICollectionReusableView
    {
        let reusableView:UICollectionReusableView
        let item:MGalleryItem = modelAtIndex(index:indexPath)
        
        if kind == UICollectionElementKindSectionHeader
        {
            let header:VGalleryHeader = collectionView.dequeueReusableSupplementaryView(
                ofKind:kind,
                withReuseIdentifier:
                VGalleryHeader.reusableIdentifier,
                for:indexPath) as! VGalleryHeader
            header.config(model:item)
            
            reusableView = header
        }
        else
        {
            let footer:VGalleryFooter = collectionView.dequeueReusableSupplementaryView(
                ofKind:kind,
                withReuseIdentifier:
                item.reusableIdentifier,
                for:indexPath) as! VGalleryFooter
            footer.config(
                controller:controller,
                model:item)
            
            reusableView = footer
        }
        
        return reusableView
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MGalleryItem = modelAtIndex(index:indexPath)
        let cell:VGalleryCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            VGalleryCell.reusableIdentifier,
            for:indexPath) as! VGalleryCell
        cell.config(model:item)
        
        return cell
    }
}
