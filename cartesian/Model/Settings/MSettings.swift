import Foundation

class MSettings
{
    let items:[MSettingsItem]
    
    init()
    {
        let itemStore:MSettingsItemStore = MSettingsItemStore()
        let itemRetina:MSettingsItemRetina = MSettingsItemRetina()
        
        items = [
            itemStore,
            itemRetina]
    }
}
