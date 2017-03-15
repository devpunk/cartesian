import Foundation

class MDrawProjectMenuLabelsFontItem
{
    let name:String
    let typeRegular:String?
    let typeBold:String?
    let typeItalic:String?
    var currentType:String?
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
        
        if let typeRegular = typeRegular
        {
            currentType = typeRegular
        }
        else if let typeBold = typeBold
        {
            currentType = typeBold
        }
        else if let typeItalic = typeItalic
        {
            currentType = typeItalic
        }
    }
    
    //MARK: public
    
    func displayName() -> String?
    {
        guard
        
            let currentType:String = self.currentType
        
        else
        {
            return nil
        }
        
        var name:String = self.name
        
        if currentType == typeRegular
        {
            name.append(NSLocalizedString("MDrawProjectMenuLabelsFontItem_typeRegular", comment:""))
        }
        else if currentType == typeBold
        {
            name.append(NSLocalizedString("MDrawProjectMenuLabelsFontItem_typeBold", comment:""))
        }
        else if currentType == typeItalic
        {
            name.append(NSLocalizedString("MDrawProjectMenuLabelsFontItem_typeItalic", comment:""))
        }
        
        return name
    }
}
