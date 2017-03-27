import UIKit

class CDrawProjectShare:CController
{
    private(set) weak var model:DProject!
    private weak var viewShare:VDrawProjectShare!
    private(set) var shareImage:UIImage?
    private let kDefaultResolution:CGFloat = 1
    private let kResolutionRetina:CGFloat = 0
    
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
        
        let resolution:CGFloat
        
        if let retina:Bool = MSession.sharedInstance.settings?.retina
        {
            if retina
            {
                resolution = kResolutionRetina
            }
            else
            {
                resolution = kDefaultResolution
            }
        }
        else
        {
            resolution = kDefaultResolution
        }
        
        UIGraphicsBeginImageContextWithOptions(canvasSize, true, resolution)
        
        guard
        
            let context:CGContext = UIGraphicsGetCurrentContext()
        
        else
        {
            return
        }
        
        context.setFillColor(UIColor.white.cgColor)
        context.addRect(canvasRect)
        context.drawPath(using:CGPathDrawingMode.fill)
        
        for link:DLink in links
        {
            MDrawProjectShareRender.renderLink(
                link:link,
                context:context)
        }
        
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
        
        UIGraphicsEndImageContext()
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
    
    func postImage()
    {
        
    }
    
    func updateImage()
    {
        
    }
}
