import UIKit

class MStoreItemNodeInputOutput:MStoreItem
{
    private let kStorePurchaseId:MStore.PurchaseId = "iturbide.cartesian.nodeInputOutput"
    
    init()
    {
        let title:String = NSLocalizedString("MStoreItemNodeInputOutput_title", comment:"")
        let descr:String = NSLocalizedString("MStoreItemNodeInputOutput_descr", comment:"")
        let image:UIImage = #imageLiteral(resourceName: "assetNodeInputOutput")
        
        super.init(
            purchaseId:kStorePurchaseId,
            title:title,
            descr:descr,
            image:image)
    }
    
    override func purchaseAction()
    {
        MSession.sharedInstance.settings?.purchaseNodeInputOutput = true
        DManager.sharedInstance?.save()
    }
    
    override func validatePurchase() -> Bool
    {
        guard
            
            let purchased:Bool = MSession.sharedInstance.settings?.purchaseNodeInputOutput
            
        else
        {
            return false
        }
        
        return purchased
    }
}
