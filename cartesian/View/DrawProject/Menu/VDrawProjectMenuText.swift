import UIKit

class VDrawProjectMenuText:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITextFieldDelegate
{
    private let modelOptions:MDrawProjectMenuText
    private weak var controller:CDrawProject!
    private weak var collectionView:VCollection!
    private weak var model:DLabel?
    private let kCellWidth:CGFloat = 90
    private let kCellHeight:CGFloat = 60
    private let kDeselectTime:TimeInterval = 0.2
    
    init(controller:CDrawProject)
    {
        modelOptions = MDrawProjectMenuText()
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let collectionView:VCollection = VCollection()
        collectionView.alwaysBounceHorizontal = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(cell:VDrawProjectMenuTextCell.self)
        self.collectionView = collectionView
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.scrollDirection = UICollectionViewScrollDirection.horizontal
            flow.itemSize = CGSize(width:kCellWidth, height:kCellHeight)
        }
        
        addSubview(collectionView)
        
        NSLayoutConstraint.topToTop(
            view:collectionView,
            toView:self)
        NSLayoutConstraint.height(
            view:collectionView,
            constant:kCellHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:collectionView,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func modelAtIndex(index:IndexPath) -> MDrawProjectMenuTextItem
    {
        let item:MDrawProjectMenuTextItem = modelOptions.items[index.item]
        
        return item
    }
    
    //MARK: public
    
    func loadLabel(model:DLabel)
    {
        self.model = model
        controller.startText(delegate:self)
    }
    
    //MARK: textField delegate
    
    func textFieldDidBeginEditing(_ textField:UITextField)
    {
        textField.text = model?.text
    }
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool
    {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField:UITextField)
    {
        guard
            
            let model:DLabel = self.model,
            let text:String = textField.text
            
        else
        {
            return
        }
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        {
            model.generate(text:text)
            DManager.sharedInstance?.save()
            
            DispatchQueue.main.async
            { [weak self] in
                
                self?.controller.endText()
                model.notifyDraw()
            }
        }
    }
    
    //MARK: collectionView delegate
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = modelOptions.items.count
        
        return count
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MDrawProjectMenuTextItem = modelAtIndex(index:indexPath)
        let cell:VDrawProjectMenuTextCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            VDrawProjectMenuTextCell.reusableIdentifier,
            for:indexPath) as! VDrawProjectMenuTextCell
        cell.config(model:item)
        
        return cell
    }
    
    func collectionView(_ collectionView:UICollectionView, didSelectItemAt indexPath:IndexPath)
    {
        collectionView.isUserInteractionEnabled = false
        
        UIApplication.shared.keyWindow!.endEditing(true)
        let item:MDrawProjectMenuTextItem = modelAtIndex(index:indexPath)
        item.selected(controller:controller)
        
        DispatchQueue.main.asyncAfter(
            deadline:DispatchTime.now() + kDeselectTime)
        { [weak collectionView] in
            
            collectionView?.selectItem(
                at:nil,
                animated:true,
                scrollPosition:UICollectionViewScrollPosition())
            collectionView?.isUserInteractionEnabled = true
        }
    }
}
