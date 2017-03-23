import UIKit

class CDrawProjectShare:CController
{
    private weak var model:DProject!
    private weak var viewShare:VDrawProjectShare!
    private(set) var shareImage:UIImage?
    
    init(model:DProject)
    {
        self.model = model
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func loadView()
    {
        let viewShare:VDrawProjectShare = VDrawProjectShare(
            controller:self)
        self.viewShare = viewShare
        view = viewShare
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidDisappear(animated)
        
        viewShare.viewDidAppear()
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.render()
        }
    }
    
    //MARK: private
    
    private func render()
    {
        guard
            
            let nodes:[DNode] = model.nodes?.array as? [DNode],
            let labels:[DLabel] = model.labels?.array as? [DLabel],
            let links:[DLink] = model.links?.array as? [DLink]
        
        else
        {
            return
        }
        
        let canvasWidth:CGFloat = CGFloat(model.width)
        let canvasHeight:CGFloat = CGFloat(model.height)
        let canvasSize:CGSize = CGSize(
            width:canvasWidth,
            height:canvasHeight)
        let canvasRect:CGRect = CGRect(
            origin:CGPoint.zero,
            size:canvasSize)
        
        UIGraphicsBeginImageContextWithOptions(canvasSize, true, 1)
        
        guard
        
            let context:CGContext = UIGraphicsGetCurrentContext()
        
        else
        {
            return
        }
        
        context.setFillColor(UIColor.white.cgColor)
        context.addRect(canvasRect)
        context.drawPath(using:CGPathDrawingMode.fill)
        
        for node:DNode in nodes
        {
            MDrawProjectShareRender.renderNode(
                node:node,
                context:context)
        }
        
        for label:DLabel in labels
        {
            MDrawProjectShareRender.renderLabel(
                label:label,
                context:context)
        }
        
        guard
            
            let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()
            
        else
        {
            UIGraphicsEndImageContext()
            
            return
        }
        
        self.shareImage = image
        
        DispatchQueue.main.async
        { [weak self] in
            
            self?.endRendering()
        }
    }
    
    private func endRendering()
    {
        viewShare.imageRendered()
    }
    
    //MARK: public
    
    func close()
    {
        parentController.dismissAnimateOver(completion:nil)
    }
    
    func exportImage()
    {
        guard
        
            let image:UIImage = shareImage
        
        else
        {
            return
        }
        
        let activity:UIActivityViewController = UIActivityViewController(
            activityItems:[image],
            applicationActivities:nil)
        
        if let popover:UIPopoverPresentationController = activity.popoverPresentationController
        {
            popover.sourceView = viewShare
            popover.sourceRect = CGRect.zero
            popover.permittedArrowDirections = UIPopoverArrowDirection.up
        }
        
        present(activity, animated:true)
    }
}
