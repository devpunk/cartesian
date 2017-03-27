import UIKit

class MStoreItemNodeStarThree:MStoreItem
{
    private let kStorePurchaseId:MStore.PurchaseId = "iturbide.cartesian.nodeStarThree"
    
    init()
    {
        let title:String = NSLocalizedString("MStoreItemNodeStarThree_title", comment:"")
        let descr:String = NSLocalizedString("MStoreItemNodeStarThree_descr", comment:"")
        let image:UIImage = #imageLiteral(resourceName: "assetNodeStarThree")
        
        super.init(
            purchaseId:kStorePurchaseId,
            title:title,
            descr:descr,
            image:image)
    }
    
    override func purchaseAction()
    {
        MSession.sharedInstance.settings?.purchaseNodeStarThree = true
        DManager.sharedInstance?.save()
    }
    
    override func validatePurchase() -> Bool
    {
        guard
            
            let purchased:Bool = MSession.sharedInstance.settings?.purchaseNodeStarThree
            
        else
        {
            return false
        }
        
        return purchased
    }
}
