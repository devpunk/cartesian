import UIKit

class MStoreItemNodeStarSix:MStoreItem
{
    private let kStorePurchaseId:MStore.PurchaseId = "iturbide.cartesian.nodeStarSix"
    
    init()
    {
        let title:String = NSLocalizedString("MStoreItemNodeStarSix_title", comment:"")
        let descr:String = NSLocalizedString("MStoreItemNodeStarSix_descr", comment:"")
        let image:UIImage = #imageLiteral(resourceName: "assetNodeStarSix")
        
        super.init(
            purchaseId:kStorePurchaseId,
            title:title,
            descr:descr,
            image:image)
    }
    
    override func purchaseAction()
    {
        MSession.sharedInstance.settings?.purchaseNodeStarSix = true
        DManager.sharedInstance?.save()
    }
    
    override func validatePurchase() -> Bool
    {
        guard
            
            let purchased:Bool = MSession.sharedInstance.settings?.purchaseNodeStarSix
            
        else
        {
            return false
        }
        
        return purchased
    }
}
