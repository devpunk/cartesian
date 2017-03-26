import UIKit

class MStoreItemNodePentagon:MStoreItem
{
    private let kStorePurchaseId:MStore.PurchaseId = "iturbide.cartesian.nodePentagon"
    
    init()
    {
        let title:String = NSLocalizedString("MStoreItemNodePentagon_title", comment:"")
        let descr:String = NSLocalizedString("MStoreItemNodePentagon_descr", comment:"")
        let image:UIImage = #imageLiteral(resourceName: "assetNodePentagon")
        
        super.init(
            purchaseId:kStorePurchaseId,
            title:title,
            descr:descr,
            image:image)
    }
    
    override func purchaseAction()
    {
        MSession.sharedInstance.settings?.purchaseNodePentagon = true
        DManager.sharedInstance?.save()
    }
    
    override func validatePurchase() -> Bool
    {
        guard
            
            let purchased:Bool = MSession.sharedInstance.settings?.purchaseNodePentagon
            
        else
        {
            return false
        }
        
        return purchased
    }
}
