import UIKit

class VDrawProjectCanvasLink:VDrawProjectCanvasView
{
    required init(
        controller:CDrawProject,
        model:DDrawable)
    {
        super.init(
            controller:controller,
            model:model)
        
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(self.notifiedLinkDraw(sender:)),
            name:Notification.linkDraw,
            object:nil)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionCenter()
    {
        guard
            
            let model:DLink = viewSpatial.model as? DLink,
            let nodeOrigin:DNode = model.origin,
            let nodeDestination:DNode = model.destination
            
        else
        {
            return
        }
        
        let originX:CGFloat = CGFloat(nodeOrigin.centerX)
        let originY:CGFloat = CGFloat(nodeOrigin.centerY)
        let originWidth:CGFloat = CGFloat(nodeOrigin.width)
        let originHeight:CGFloat = CGFloat(nodeOrigin.height)
        let originWidth_2:CGFloat = originWidth / 2.0
        let originHeight_2:CGFloat = originHeight / 2.0
        let originMinX:CGFloat = originX - originWidth_2
        let originMinY:CGFloat = originY - originHeight_2
        let originMaxX:CGFloat = originX + originWidth_2
        let originMaxY:CGFloat = originY + originHeight_2
        
        let destinationX:CGFloat = CGFloat(nodeDestination.centerX)
        let destinationY:CGFloat = CGFloat(nodeDestination.centerY)
        let destinationWidth:CGFloat = CGFloat(nodeDestination.width)
        let destinationHeight:CGFloat = CGFloat(nodeDestination.height)
        let destinationWidth_2:CGFloat = destinationWidth / 2.0
        let destinationHeight_2:CGFloat = destinationHeight / 2.0
        let destinationMinX:CGFloat = destinationX - destinationWidth_2
        let destinationMinY:CGFloat = destinationY - destinationHeight_2
        let destinationMaxX:CGFloat = destinationX + destinationWidth_2
        let destinationMaxY:CGFloat = destinationY + destinationHeight_2
        
        let minX:CGFloat = min(originMinX, destinationMinX)
        let maxX:CGFloat = max(originMaxX, destinationMaxX)
        let minY:CGFloat = min(originMinY, destinationMinY)
        let maxY:CGFloat = max(originMaxY, destinationMaxY)
        let deltaX:CGFloat = maxX - minX
        let deltaY:CGFloat = maxY - minY
        
        let marginedX:CGFloat = minX - kMargin
        let marginedY:CGFloat = minY - kMargin
        let widthMargin:CGFloat = deltaX + margin2
        let heightMargin:CGFloat = deltaY + margin2
        
        frame = CGRect(
            x:marginedX,
            y:marginedY,
            width:widthMargin,
            height:heightMargin)
    }
    
    //MARK: notifications
    
    func notifiedLinkDraw(sender notification:Notification)
    {
        guard
            
            let linkSender:DLink = notification.object as? DLink,
            let currentLink:DLink = viewSpatial.model as? DLink
            
        else
        {
            return
        }
        
        if currentLink === linkSender
        {
            fullRedraw()
        }
    }
}
