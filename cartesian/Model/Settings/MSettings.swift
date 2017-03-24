import Foundation

class MSettings
{
    let items:[MSettingsItem]
    
    init()
    {
        let itemStore:MSettingsItemStore = MSettingsItemStore()
        let itemRetina:MSettingsItemRetina = MSettingsItemRetina()
        let itemShare:MSettingsItemShare = MSettingsItemShare()
        let itemReview:MSettingsItemReview = MSettingsItemReview()
        
        items = [
            itemStore,
            itemRetina,
            itemShare,
            itemReview]
    }
}
