import UIKit

class MStoreItemNodeLozenge:MStoreItem
{
    private let kStorePurchaseId:MStore.PurchaseId = "iturbide.cartesian.nodeLozenge"
    
    init()
    {
        let title:String = NSLocalizedString("MStoreItemNodeLozenge_title", comment:"")
        let descr:String = NSLocalizedString("MStoreItemNodeLozenge_descr", comment:"")
        let image:UIImage = #imageLiteral(resourceName: "assetNodeLozenge")
        
        super.init(
            purchaseId:kStorePurchaseId,
            title:title,
            descr:descr,
            image:image)
    }
    
    override func purchaseAction()
    {
        MSession.sharedInstance.settings?.purchaseNodeLozenge = true
        DManager.sharedInstance?.save()
    }
    
    override func validatePurchase() -> Bool
    {
        guard
            
            let purchased:Bool = MSession.sharedInstance.settings?.purchaseNodeLozenge
            
        else
        {
            return false
        }
        
        return purchased
    }
}
