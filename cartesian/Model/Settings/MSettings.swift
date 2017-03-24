import Foundation

class MSettings
{
    let items:[MSettingsItem]
    
    init()
    {
        let itemStore:MSettingsItemStore = MSettingsItemStore()
        let itemRetina:MSettingsItemRetina = MSettingsItemRetina()
        let itemShare:MSettingsItemShare = MSettingsItemShare()
        
        items = [
            itemStore,
            itemRetina,
            itemShare]
    }
}
