import UIKit

class VDrawProjectMenuEditInfo:UIView
{
    private weak var labelInfoLeft:UILabel!
    private weak var labelInfoRight:UILabel!
    private weak var layoutLabelLeftWidth:NSLayoutConstraint!
    private weak var layoutLabelRightWidth:NSLayoutConstraint!
    private let numberFormatter:NumberFormatter
    private let attributesSubtitle:[String:AnyObject]
    private let titlePositionX:NSAttributedString
    private let titlePositionY:NSAttributedString
    private let titleWidth:NSAttributedString
    private let titleHeight:NSAttributedString
    private let kLabelHorizontal:CGFloat = 10
    private let kMaxDecimals:Int = 2
    private let kMinDecimals:Int = 0
    private let kMinIntegers:Int = 1
    
    init()
    {
        numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumFractionDigits = kMaxDecimals
        numberFormatter.minimumFractionDigits = kMinDecimals
        numberFormatter.minimumIntegerDigits = kMinIntegers
        
        let attributesTitle:[String:AnyObject] = [
            NSFontAttributeName:UIFont.bold(size:12),
            NSForegroundColorAttributeName:UIColor(white:0.6, alpha:1)]
        
        attributesSubtitle = [
            NSFontAttributeName:UIFont.numeric(size:13),
            NSForegroundColorAttributeName:UIColor(white:0.2, alpha:1)]
        
        titlePositionX = NSAttributedString(
            string:NSLocalizedString("VDrawProjectMenuEditInfo_titlePositionX", comment:""),
            attributes:attributesTitle)
        titlePositionY = NSAttributedString(
            string:NSLocalizedString("VDrawProjectMenuEditInfo_titlePositionY", comment:""),
            attributes:attributesTitle)
        titleWidth = NSAttributedString(
            string:NSLocalizedString("VDrawProjectMenuEditInfo_titleWidth", comment:""),
            attributes:attributesTitle)
        titleHeight = NSAttributedString(
            string:NSLocalizedString("VDrawProjectMenuEditInfo_titleHeight", comment:""),
            attributes:attributesTitle)
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        
        let labelInfoLeft:UILabel = UILabel()
        labelInfoLeft.isUserInteractionEnabled = false
        labelInfoLeft.translatesAutoresizingMaskIntoConstraints = false
        labelInfoLeft.backgroundColor = UIColor.clear
        labelInfoLeft.numberOfLines = 0
        self.labelInfoLeft = labelInfoLeft
        
        let labelInfoRight:UILabel = UILabel()
        labelInfoRight.isUserInteractionEnabled = false
        labelInfoRight.translatesAutoresizingMaskIntoConstraints = false
        labelInfoRight.backgroundColor = UIColor.clear
        labelInfoRight.numberOfLines = 0
        self.labelInfoRight = labelInfoRight
        
        addSubview(labelInfoLeft)
        addSubview(labelInfoRight)
        
        NSLayoutConstraint.equalsVertical(
            view:labelInfoLeft,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:labelInfoLeft,
            toView:self,
            constant:kLabelHorizontal)
        layoutLabelLeftWidth = NSLayoutConstraint.width(
            view:labelInfoLeft)
        
        NSLayoutConstraint.equalsVertical(
            view:labelInfoRight,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:labelInfoRight,
            toView:self,
            constant:-kLabelHorizontal)
        layoutLabelRightWidth = NSLayoutConstraint.width(
            view:labelInfoRight)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.maxX
        let width_2:CGFloat = width / 2.0
        layoutLabelLeftWidth.constant = width_2
        layoutLabelRightWidth.constant = width_2
        
        super.layoutSubviews()
    }
    
    //MARK: private
    
    private func asyncShowInfo(model:DNode)
    {
        let mutableStringLeft:NSMutableAttributedString = NSMutableAttributedString()
        let mutableStringRight:NSMutableAttributedString = NSMutableAttributedString()
        
        let modelCenterX:Float = model.centerX
        let modelCenterY:Float = model.centerY
        let modelWidth:Float = model.width
        let modelHeight:Float = model.height
        let modelWidth_2:Float = modelWidth / 2.0
        let modelHeight_2:Float = modelHeight / 2.0
        let originX:Float = modelCenterX - modelWidth_2
        let originY:Float = modelCenterY - modelHeight_2
        
        guard
            
            let rawStringPositionX:String = numberFormatter.string(from:originX as NSNumber),
            let rawStringPositionY:String = numberFormatter.string(from:originY as NSNumber),
            let rawStringWidth:String = numberFormatter.string(from:modelWidth as NSNumber),
            let rawStringHeight:String = numberFormatter.string(from:modelHeight as NSNumber)
        
        else
        {
            return
        }
        
        let stringPositionX:NSAttributedString = NSAttributedString(
            string:rawStringPositionX,
            attributes:attributesSubtitle)
        let stringPositionY:NSAttributedString = NSAttributedString(
            string:rawStringPositionY,
            attributes:attributesSubtitle)
        let stringWidth:NSAttributedString = NSAttributedString(
            string:rawStringWidth,
            attributes:attributesSubtitle)
        let stringHeight:NSAttributedString = NSAttributedString(
            string:rawStringHeight,
            attributes:attributesSubtitle)
        
        mutableStringLeft.append(titlePositionX)
        mutableStringLeft.append(stringPositionX)
        mutableStringLeft.append(titlePositionY)
        mutableStringLeft.append(stringPositionY)
        
        mutableStringRight.append(titleWidth)
        mutableStringRight.append(stringWidth)
        mutableStringRight.append(titleHeight)
        mutableStringRight.append(stringHeight)
        
        infoStrings(
            infoLeft:mutableStringLeft,
            infoRight:mutableStringRight)
    }
    
    private func infoStrings(infoLeft:NSAttributedString, infoRight:NSAttributedString)
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.labelInfoLeft.attributedText = infoLeft
            self?.labelInfoRight.attributedText = infoRight
        }
    }
    
    //MARK: public
    
    func showInfo(model:DNode)
    {
        labelInfoLeft.attributedText = nil
        labelInfoRight.attributedText = nil
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncShowInfo(model:model)
        }
    }
}
