import UIKit

protocol MDrawProjectSizeDelegate:class
{
    func sizeChanged(width:CGFloat, height:CGFloat)
    func originalWidth() -> CGFloat
    func originalHeight() -> CGFloat
}
