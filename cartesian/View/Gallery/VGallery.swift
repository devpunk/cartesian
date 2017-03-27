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
    
    //MARK: collectionView delegate
    
    func numberOfSections(in collectionView:UICollectionView) -> Int
    {
        
    }
}
