import UIKit

class VDrawProjectMenuText:UIView, UITextFieldDelegate
{
    private weak var controller:CDrawProject!
    private weak var model:DLabel?
    
    init(controller:CDrawProject)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: public
    
    func loadLabel(model:DLabel)
    {
        self.model = model
        controller.startText(delegate:self)
    }
    
    //MARK: textField delegate
    
    func textFieldDidBeginEditing(_ textField:UITextField)
    {
        textField.text = model?.text
    }
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool
    {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField:UITextField)
    {
        guard
            
            let model:DLabel = self.model,
            let text:String = textField.text
            
        else
        {
            return
        }
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        {
            model.generate(text:text)
            DManager.sharedInstance?.save()
            
            DispatchQueue.main.async
            { [weak self] in
                
                self?.controller.endText()
                model.notifyDraw()
            }
        }
    }
}
