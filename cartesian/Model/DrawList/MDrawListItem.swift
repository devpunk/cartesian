import UIKit

class MDrawListItem
{
    let project:DProject
    var image:UIImage?
    
    init(project:DProject)
    {
        self.project = project
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.renderImage()
        }
    }
    
    //MARK: private
    
    private func renderImage()
    {
    }
}
