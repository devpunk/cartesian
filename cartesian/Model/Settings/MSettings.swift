import Foundation

class MSettings
{
    let items:[MSettingsItem]
    
    init()
    {
        let itemStore:MSettingsItemStore = MSettingsItemStore()
        
        items = [
            itemStore]
    }
}
