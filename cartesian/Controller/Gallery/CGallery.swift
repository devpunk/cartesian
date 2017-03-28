import UIKit

class CGallery:CController
{
    let model:MGallery
    private weak var viewGallery:VGallery!
    
    override init()
    {
        model = MGallery()
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func loadView()
    {
        let viewGallery:VGallery = VGallery(controller:self)
        self.viewGallery = viewGallery
        view = viewGallery
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        
        viewGallery.startLoading()
        model.fetchGallery(controller:self)
    }
    
    //MARK: public
    
    func galleryLoaded()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.viewGallery.stopLoading()
        }
    }
    
    func shareItem(model:MGalleryItem)
    {
        
    }
}
