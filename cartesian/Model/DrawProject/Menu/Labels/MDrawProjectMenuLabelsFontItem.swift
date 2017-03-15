import Foundation

class MDrawProjectMenuLabelsFontItem
{
    let name:String
    let typeRegular:String?
    let typeBold:String?
    let typeItalic:String?
    private let kKeyName:String = "name"
    private let kKeyType:String = "type"
    private let kKeyTypeRegular:String = "regular"
    private let kKeyTypeBold:String = "bold"
    private let kKeyTypeItalic:String = "italic"
    
    init(raw:[String:AnyObject])
    {
        if let name:String = raw[kKeyName] as? String
        {
            self.name = name
        }
        else
        {
            self.name = NSLocalizedString("MDrawProjectMenuLabelsFontItem_noName", comment:"")
        }
        
        let type:[String:String]? = raw[kKeyType] as? [String:String]
        typeRegular = type?[kKeyTypeRegular]
        typeBold = type?[kKeyTypeBold]
        typeItalic = type?[kKeyTypeItalic]
    }
}
