import UIKit

class MStoreItemNodeHexagon:MStoreItem
{
    private let kStorePurchaseId:MStore.PurchaseId = "iturbide.cartesian.nodeHexagon"
    
    init()
    {
        let title:String = NSLocalizedString("MStoreItemNodeHexagon_title", comment:"")
        let descr:String = NSLocalizedString("MStoreItemNodeHexagon_descr", comment:"")
        let image:UIImage = #imageLiteral(resourceName: "assetNodeHexagon")
        
        super.init(
            purchaseId:kStorePurchaseId,
            title:title,
            descr:descr,
            image:image)
    }
    
    override func purchaseAction()
    {
        MSession.sharedInstance.settings?.purchaseNodeHexagon = true
        DManager.sharedInstance?.save()
    }
    
    override func validatePurchase() -> Bool
    {
        guard
            
            let purchased:Bool = MSession.sharedInstance.settings?.purchaseNodeHexagon
            
        else
        {
            return false
        }
        
        return purchased
    }
}
