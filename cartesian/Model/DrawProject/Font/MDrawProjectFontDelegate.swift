import Foundation

protocol MDrawProjectFontDelegate:class
{
    func fontSelected(model:MDrawProjectMenuLabelsFontItem)
    func fontCurrent() -> String?
    func fontModel() -> MDrawProjectMenuLabelsFont?
}
