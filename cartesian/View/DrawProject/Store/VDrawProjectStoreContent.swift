import UIKit

class VDrawProjectStoreContent:UIView
{
    private weak var controller:CDrawProject!
    private weak var purchase:MDrawProjectMenuNodesItem!
    private weak var layoutBaseLeft:NSLayoutConstraint!
    private weak var layoutCircleLeft:NSLayoutConstraint!
    private let kBaseWidth:CGFloat = 299
    private let kBaseHeight:CGFloat = 180
    private let kBaseBottom:CGFloat = -2
    private let kCornerRadius:CGFloat = 20
    private let kCircleTop:CGFloat = 2
    private let kCircleSize:CGFloat = 140
    
    init(controller:CDrawProject,
         purchase:MDrawProjectMenuNodesItem)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        self.purchase = purchase
        
        let baseView:UIView = UIView()
        baseView.translatesAutoresizingMaskIntoConstraints = false
        baseView.clipsToBounds = true
        baseView.backgroundColor = UIColor.white
        baseView.layer.cornerRadius = kCornerRadius
        
        let circle:UIView = UIView()
        circle.isUserInteractionEnabled = false
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.clipsToBounds = true
        circle.backgroundColor = UIColor.white
        circle.layer.cornerRadius = kCircleSize / 2.0
        
        addSubview(baseView)
        addSubview(circle)
        
        NSLayoutConstraint.bottomToBottom(
            view:baseView,
            toView:self)
        NSLayoutConstraint.height(
            view:baseView,
            constant:kBaseHeight)
        layoutBaseLeft = NSLayoutConstraint.leftToLeft(
            view:baseView,
            toView:self)
        NSLayoutConstraint.width(
            view:baseView,
            constant:kBaseWidth)
        
        NSLayoutConstraint.topToTop(
            view:circle,
            toView:self,
            constant:kCircleTop)
        layoutCircleLeft = NSLayoutConstraint.leftToLeft(
            view:circle,
            toView:self)
        NSLayoutConstraint.size(
            view:circle,
            constant:kCircleSize)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.maxX
        let remainBase:CGFloat = width - kBaseWidth
        let baseLeft:CGFloat = remainBase / 2.0
        let remainCircle:CGFloat = width - kCircleSize
        let circleLeft:CGFloat = remainCircle / 2.0
        
        layoutBaseLeft.constant = baseLeft
        layoutCircleLeft.constant = circleLeft
        
        super.layoutSubviews()
    }
}
