import UIKit

class VGalleryBar:UIView
{
    private weak var controller:CGallery!
    private weak var segmented:UISegmentedControl!
    private weak var layoutSegmentedLeft:NSLayoutConstraint!
    private let kBorderHeight:CGFloat = 1
    private let kSegmentedWidth:CGFloat = 310
    private let kSegmentedHeight:CGFloat = 30
    private let kSegmentedTop:CGFloat = 6
    
    init(controller:CGallery)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let segmentedItems:[String] = [
            NSLocalizedString("VGalleryBar_titleTime", comment:""),
            NSLocalizedString("VGalleryBar_titleLikes", comment:""),
            NSLocalizedString("VGalleryBar_titleMine", comment:"")]
        
        let blur:VBlur = VBlur.light()
        let border:VBorder = VBorder(color:UIColor(white:0, alpha:0.1))
        
        let segmented:UISegmentedControl = UISegmentedControl(
            items:segmentedItems)
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.addTarget(
            self,
            action:#selector(actionSegmented(sender:)),
            for:UIControlEvents.valueChanged)
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
    
    //MARK: actions
    
    func actionSegmented(sender segmented:UISegmentedControl)
    {
        segmented.isUserInteractionEnabled = false
        
        let itemSelected:Int = segmented.selectedSegmentIndex
        let sorting:MGallery.Sort
        
        switch itemSelected
        {
        case 0:
            
            sorting = MGallery.Sort.time
            
            break
            
        case 1:
            
            sorting = MGallery.Sort.likes
            
            break
            
        default:
            
            sorting = MGallery.Sort.mine
            
            break
        }
        
        controller.model.sortGallery(sorting:sorting)
    }
    
    //MARK: public
    
    func refresh()
    {
        segmented.isUserInteractionEnabled = true
        
        switch controller.model.sorting
        {
        case MGallery.Sort.time:
            
            segmented.selectedSegmentIndex = 0
            
            break
            
        case MGallery.Sort.likes:
            
            segmented.selectedSegmentIndex = 1
            
            break
            
        case MGallery.Sort.mine:
            
            segmented.selectedSegmentIndex = 2
            
            break
        }
    }
}
