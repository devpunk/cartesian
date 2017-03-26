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
        MSession.sharedInstance.settings?.purchasePlus()
    }
    
    override func validatePurchase() -> Bool
    {
        var isPurchased:Bool = false
        
        guard
            
            let plus:Bool = MSession.sharedInstance.settings?.plus
            
        else
        {
            return isPurchased
        }
        
        isPurchased = plus
        
        return isPurchased
    }
}
