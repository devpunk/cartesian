import UIKit

class MDrawListItem
{
    let project:DProject
    private(set) var image:UIImage?
    
    init(project:DProject)
    {
        self.project = project
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.renderImage()
        }
    }
    
    //MARK: private
    
    private func renderImage()
    {
        guard
            
            let nodes:[DNode] = project.nodes?.array as? [DNode]
            
        else
        {
            return
        }
        
        let canvasWidth:CGFloat = CGFloat(project.width)
        let canvasHeight:CGFloat = CGFloat(project.height)
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
            MDrawListItemRender.renderNode(
                node:node,
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
        imageRendered(image:image)
    }
    
    private func imageRendered(image:UIImage)
    {
        self.image = image
        
        NotificationCenter.default.post(
            name:Notification.listItemRendered,
            object:self)
    }
}
