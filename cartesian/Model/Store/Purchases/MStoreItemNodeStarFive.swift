import UIKit

class MStoreItemNodeStarFive:MStoreItem
{
    private let kStorePurchaseId:MStore.PurchaseId = "iturbide.cartesian.nodeStarFive"
    
    init()
    {
        let title:String = NSLocalizedString("MStoreItemNodeStarFive_title", comment:"")
        let descr:String = NSLocalizedString("MStoreItemNodeStarFive_descr", comment:"")
        let image:UIImage = #imageLiteral(resourceName: "assetNodeStarFive")
        
        super.init(
            purchaseId:kStorePurchaseId,
            title:title,
            descr:descr,
            image:image)
    }
    
    override func purchaseAction()
    {
        MSession.sharedInstance.settings?.purchaseNodeStarFive = true
        DManager.sharedInstance?.save()
    }
    
    override func validatePurchase() -> Bool
    {
        guard
            
            let purchased:Bool = MSession.sharedInstance.settings?.purchaseNodeStarFive
            
        else
        {
            return false
        }
        
        return purchased
    }
}
