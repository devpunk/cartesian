import UIKit

class VDrawProjectFontCell:UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private var modelTypes:MDrawProjectFontType?
    private weak var controller:CDrawProject?
    private weak var model:MDrawProjectMenuLabelsFontItem?
    private weak var label:UILabel!
    private weak var collectionView:VCollection!
    private let kCellWidth:CGFloat = 100
    private let kBorderHeight:CGFloat = 1
    private let kLabelMargin:CGFloat = 10
    private let kLabelHeight:CGFloat = 42
    private let kFontSize:CGFloat = 20
    private let kAlphaSelected:CGFloat = 1
    private let kAlphaNotSelected:CGFloat = 0.5
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        
        let borderTop:VBorder = VBorder(color:UIColor(white:0, alpha:0.1))
        let borderBottom:VBorder = VBorder(color:UIColor(white:0, alpha:0.1))
        
        let label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        self.label = label
        
        let collectionView:VCollection = VCollection()
        collectionView.isScrollEnabled = false
        collectionView.bounces = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(cell:VDrawProjectFontCellType.self)
        self.collectionView = collectionView
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.scrollDirection = UICollectionViewScrollDirection.horizontal
        }
        
        addSubview(borderTop)
        addSubview(borderBottom)
        addSubview(label)
        addSubview(collectionView)
        
        NSLayoutConstraint.topToBottom(
            view:borderTop,
            toView:label)
        NSLayoutConstraint.height(
            view:borderTop,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:borderTop,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:borderBottom,
            toView:self)
        NSLayoutConstraint.height(
            view:borderBottom,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:borderBottom,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:label,
            toView:self)
        NSLayoutConstraint.height(
            view:label,
            constant:kLabelHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:label,
            toView:self,
            margin:kLabelMargin)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override var isSelected:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    override var isHighlighted:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    //MARK: private
    
    private func hover()
    {
        if isSelected || isHighlighted
        {
            alpha = kAlphaSelected
            backgroundColor = UIColor.clear
        }
        else
        {
            alpha = kAlphaNotSelected
            backgroundColor = UIColor(white:0.93, alpha:1)
        }
    }
    
    private func modelAtIndex(index:IndexPath) -> MDrawProjectFontTypeItem
    {
        let item:MDrawProjectFontTypeItem = modelTypes!.items[index.item]
        
        return item
    }
    
    private func updateLabel()
    {
        guard
            
            let model:MDrawProjectMenuLabelsFontItem = self.model
        
        else
        {
            return
        }
        
        label.text = model.name
        label.font = UIFont.systemFont(ofSize:kFontSize)
        
        if let currentType:String = model.currentType
        {
            if let font:UIFont = UIFont(name:currentType, size:kFontSize)
            {
                label.font = font
            }
        }
    }
    
    //MARK: public
    
    func config(controller:CDrawProject, model:MDrawProjectMenuLabelsFontItem)
    {
        self.controller = controller
        self.model = model
        modelTypes = MDrawProjectFontType(model:model)
        
        collectionView.reloadData()
        
        if let indexSelected:IndexPath = modelTypes?.indexPath
        {
            collectionView.selectItem(
                at:indexSelected,
                animated:true,
                scrollPosition:UICollectionViewScrollPosition())
        }
        
        updateLabel()
        hover()
    }
    
    //MARK: collectionView delegate
    
    func numberOfSections(in collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        guard
        
            let count:Int = modelTypes?.items.count
        
        else
        {
            return 0
        }
        
        return count
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MDrawProjectFontTypeItem = modelAtIndex(index:indexPath)
        let cell:VDrawProjectFontCellType = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            VDrawProjectFontCellType.reusableIdentifier,
            for:indexPath) as! VDrawProjectFontCellType
        cell.config(model:item)
        
        return cell
    }
    
    func collectionView(_ collectionView:UICollectionView, didSelectItemAt indexPath:IndexPath)
    {
        guard
            
            let model:MDrawProjectMenuLabelsFontItem = self.model
        
        else
        {
            return
        }
        
        let item:MDrawProjectFontTypeItem = modelAtIndex(index:indexPath)
        item.selected(model:model)
        updateLabel()
    }
}
