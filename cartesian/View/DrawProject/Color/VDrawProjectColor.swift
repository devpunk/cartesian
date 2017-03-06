import UIKit

class VDrawProjectColor:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private weak var controller:CDrawProject!
    private(set) weak var viewBar:VDrawProjectColorBar!
    private weak var collectionView:VCollection!
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        
        let viewBar:VDrawProjectColorBa
        
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    // collectionView delegate
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    
}
