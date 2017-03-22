import Foundation
import CoreData

extension DProject
{
    private static let kInitialSize:Int16 = 1000
    
    //MARK: private
    
    private func defaultTitle() -> String
    {
        let title:String = NSLocalizedString("DProject_defaultTitle", comment:"")
        
        return title
    }
    
    //MARK: public
    
    func defaultValues()
    {
        width = DProject.kInitialSize
        height = DProject.kInitialSize
    }
    
    func projectName() -> String
    {
        guard
        
            let title:String = self.title
        
        else
        {
            return defaultTitle()
        }
        
        if title.isEmpty
        {
            return defaultTitle()
        }
        else
        {
            return title
        }
    }
}
