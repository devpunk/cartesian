import UIKit

class MStoreItemNodeTriangle:MStoreItem
{
    private let kStorePurchaseId:MStore.PurchaseId = "iturbide.cartesian.nodeTriangle"
    
    init()
    {
        let title:String = NSLocalizedString("MStoreItemNodeTriangle_title", comment:"")
        let descr:String = NSLocalizedString("MStoreItemNodeTriangle_descr", comment:"")
        let image:UIImage = #imageLiteral(resourceName: "assetNodeTriangle")
        
        super.init(
            purchaseId:kStorePurchaseId,
            title:title,
            descr:descr,
            image:image)
    }
    
    override func purchaseAction()
    {
        MSession.sharedInstance.settings?.purchaseNodeTriangle = true
        DManager.sharedInstance?.save()
    }
    
    override func validatePurchase() -> Bool
    {
        guard
            
            let purchased:Bool = MSession.sharedInstance.settings?.purchaseNodeTriangle
            
        else
        {
            return false
        }
        
        return purchased
    }
}
