import UIKit

class VGallery:VView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private weak var controller:CGallery!
    private weak var spinner:VSpinner!
    private weak var viewBar:VGalleryBar!
    private weak var collectionView:VCollection!
    
    override init(controller:CController)
    {
        super.init(controller:controller)
        self.controller = controller as? CGallery
        
        let spinner:VSpinner = VSpinner()
        self.spinner = spinner
        
        addSubview(spinner)
        
        NSLayoutConstraint.equals(
            view:spinner,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
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
        spinner.startAnimating()
        viewBar.isHidden = true
        collectionView.isHidden = true
        collectionView.reloadData()
    }
    
    //MARK: collectionView delegate
    
    func numberOfSections(in collectionView:UICollectionView) -> Int
    {
        let count:Int = controller.model.displayItems.count
        
        return count
    }
    
    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        return 1
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
