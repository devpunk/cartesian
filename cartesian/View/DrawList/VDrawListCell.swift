import UIKit

class VDrawListCell:UICollectionViewCell
{
    private weak var controller:CDrawList?
    private weak var model:MDrawListItem?
    private weak var label:UILabel!
    private weak var imageView:UIImageView!
    private let kCornerRadius:CGFloat = 5
    private let kImageSize:CGFloat = 90
    private let kLabelHeight:CGFloat = 26
    private let kContentTop:CGFloat = 10
    private let kContentLeft:CGFloat = 10
    private let kBorderWidth:CGFloat = 1
    private let kButtonSize:CGFloat = 50
    private let kAlphaSelected:CGFloat = 0.15
    private let kAlphaNotSelected:CGFloat = 1
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let imageView:UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        imageView.backgroundColor = UIColor.white
        imageView.isUserInteractionEnabled = false
        imageView.layer.cornerRadius = kCornerRadius
        imageView.layer.borderColor = UIColor(white:0, alpha:0.5).cgColor
        imageView.layer.borderWidth = kBorderWidth
        self.imageView = imageView
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.font = UIFont.medium(size:14)
        label.textColor = UIColor.black
        self.label = label
        
        let buttonTrash:UIButton = UIButton()
        buttonTrash.translatesAutoresizingMaskIntoConstraints = false
        buttonTrash.setImage(
            #imageLiteral(resourceName: "assetGenericTrash").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.normal)
        buttonTrash.setImage(
            #imageLiteral(resourceName: "assetGenericTrash").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.highlighted)
        buttonTrash.imageView!.clipsToBounds = true
        buttonTrash.imageView!.tintColor = UIColor(white:0, alpha:0.1)
        buttonTrash.imageView!.contentMode = UIViewContentMode.center
        buttonTrash.addTarget(
            self,
            action:#selector(actionTrash(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let buttonShare:UIButton = UIButton()
        buttonShare.translatesAutoresizingMaskIntoConstraints = false
        buttonShare.setImage(
            #imageLiteral(resourceName: "assetGenericShareSimple").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.normal)
        buttonShare.setImage(
            #imageLiteral(resourceName: "assetGenericShareSimple").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.highlighted)
        buttonShare.imageView!.clipsToBounds = true
        buttonShare.imageView!.tintColor = UIColor(white:0, alpha:0.1)
        buttonShare.imageView!.contentMode = UIViewContentMode.center
        buttonShare.addTarget(
            self,
            action:#selector(actionShare(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(label)
        addSubview(imageView)
        addSubview(buttonTrash)
        addSubview(buttonShare)
        
        NSLayoutConstraint.topToTop(
            view:imageView,
            toView:self,
            constant:kContentTop)
        NSLayoutConstraint.leftToLeft(
            view:imageView,
            toView:self,
            constant:kContentLeft)
        NSLayoutConstraint.size(
            view:imageView,
            constant:kImageSize)
        
        NSLayoutConstraint.topToTop(
            view:label,
            toView:self,
            constant:kContentTop)
        NSLayoutConstraint.height(
            view:label,
            constant:kLabelHeight)
        NSLayoutConstraint.leftToRight(
            view:label,
            toView:imageView,
            constant:kContentLeft)
        NSLayoutConstraint.rightToRight(
            view:label,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:buttonTrash,
            toView:self)
        NSLayoutConstraint.leftToRight(
            view:buttonTrash,
            toView:imageView)
        NSLayoutConstraint.size(
            view:buttonTrash,
            constant:kButtonSize)
        
        NSLayoutConstraint.bottomToBottom(
            view:buttonShare,
            toView:self)
        NSLayoutConstraint.leftToRight(
            view:buttonShare,
            toView:buttonTrash,
            constant:kContentLeft)
        NSLayoutConstraint.size(
            view:buttonShare,
            constant:kButtonSize)
        
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(notifiedListItemRendered(sender:)),
            name:Notification.listItemRendered,
            object:nil)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    deinit
    {
        NotificationCenter.default.removeObserver(self)
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
    
    //MARK: notifications
    
    func notifiedListItemRendered(sender notification:Notification)
    {
        guard
        
            let itemSender:MDrawListItem = notification.object as? MDrawListItem,
            let model:MDrawListItem = self.model
        
        else
        {
            return
        }
        
        if itemSender === model
        {
            DispatchQueue.main.async
            { [weak self] in
                
                self?.updateImage()
            }
        }
    }
    
    //MARK: actions
    
    func actionTrash(sender button:UIButton)
    {
        guard
        
            let project:DProject = model?.project
        
        else
        {
            return
        }
        
        controller?.trashDraw(project:project)
    }
    
    func actionShare(sender button:UIButton)
    {
        guard
        
            let project:DProject = model?.project
        
        else
        {
            return
        }
        
        controller?.shareProject(project:project)
    }
    
    //MARK: private
    
    private func hover()
    {
        if isSelected || isHighlighted
        {
            alpha = kAlphaSelected
        }
        else
        {
            alpha = kAlphaNotSelected
        }
    }
    
    private func updateImage()
    {
        imageView.image = model?.image
    }
    
    //MARK: public
    
    func config(controller:CDrawList, model:MDrawListItem)
    {
        self.controller = controller
        self.model = model
        self.updateImage()
        label.text = model.project.projectName()
        hover()
    }
}
