import UIKit

class VDrawProjectScroll:UIScrollView
{
    private weak var controller:CDrawProject!
    private var layoutStarted:Bool
    
    init(controller:CDrawProject)
    {
        layoutStarted = false
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        if !layoutStarted
        {
            layoutStarted = true
            contentSize = bounds.size
        }
        
        super.layoutSubviews()
    }
}