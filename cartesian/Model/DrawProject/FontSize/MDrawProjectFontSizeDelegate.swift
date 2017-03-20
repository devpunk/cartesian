import Foundation

protocol MDrawProjectFontSizeDelegate:class
{
    func fontSizeSelected(size:Int16)
    func fontCurrentSize() -> Int16?
}
