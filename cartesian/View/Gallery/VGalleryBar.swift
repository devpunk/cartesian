import UIKit

class VGalleryBar:UIView
{
    private weak var controller:CGallery!
    private weak var segmented:UISegmentedControl!
    private weak var layoutSegmentedLeft:NSLayoutConstraint!
    private let kBorderHeight:CGFloat = 1
    private let kSegmentedWidth:CGFloat = 310
    private let kSegmentedHeight:CGFloat = 30
    private let kSegmentedTop:CGFloat = 5
    
    init(controller:CGallery)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        
        let segmentedItems:[String] = [
            NSLocalizedString("VGalleryBar_titleTime", comment:""),
            NSLocalizedString("VGalleryBar_titleLikes", comment:""),
            NSLocalizedString("VGalleryBar_titleMine", comment:"")]
        
        let blur:VBlur = VBlur.light()
        let border:VBorder = VBorder(color:UIColor(white:0, alpha:0.1))
        
        let segmented:UISegmentedControl = UISegmentedControl(
            items:segmentedItems)
        segmented.translatesAutoresizingMaskIntoConstraints = false
        self.segmented = segmented
        
        addSubview(blur)
        addSubview(border)
        addSubview(segmented)
        
        NSLayoutConstraint.equals(
            view:blur,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:segmented,
            toView:self,
            constant:kSegmentedTop)
        NSLayoutConstraint.height(
            view:segmented,
            constant:kSegmentedHeight)
        layoutSegmentedLeft = NSLayoutConstraint.leftToLeft(
            view:segmented,
            toView:self)
        NSLayoutConstraint.width(
            view:segmented,
            constant:kSegmentedWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.maxX
        let remainSegmented:CGFloat = width - kSegmentedWidth
        let segmentedLeft:CGFloat = remainSegmented / 2.0
        layoutSegmentedLeft.constant = segmentedLeft
        
        super.layoutSubviews()
    }
    
    //MARK: public
    
    func refresh()
    {
        
    }
}
