import Foundation

protocol MDrawProjectFontDelegate:class
{
    func fontSelected(fontName:String)
    func fontCurrent() -> String?
}
