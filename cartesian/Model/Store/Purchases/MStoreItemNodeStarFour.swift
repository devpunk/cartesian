import UIKit

class MStoreItemNodeStarFour:MStoreItem
{
    private let kStorePurchaseId:MStore.PurchaseId = "iturbide.cartesian.nodeStarFour"
    
    init()
    {
        let title:String = NSLocalizedString("MStoreItemNodeStarFour_title", comment:"")
        let descr:String = NSLocalizedString("MStoreItemNodeStarFour_descr", comment:"")
        let image:UIImage = #imageLiteral(resourceName: "assetNodeStarFour")
        
        super.init(
            purchaseId:kStorePurchaseId,
            title:title,
            descr:descr,
            image:image)
    }
    
    override func purchaseAction()
    {
        MSession.sharedInstance.settings?.purchaseNodeStarFour = true
        DManager.sharedInstance?.save()
    }
    
    override func validatePurchase() -> Bool
    {
        guard
            
            let purchased:Bool = MSession.sharedInstance.settings?.purchaseNodeStarFour
            
        else
        {
            return false
        }
        
        return purchased
    }
}
