import UIKit

class MDrawProjectCanvasEffectItem
{
    var positionY:CGFloat
    let positionX:CGFloat
    let maxPositionY:CGFloat
    private let stepDelta:CGFloat
    private let kStepMinDelta:CGFloat = -1
    private let KStepAddedDelta:UInt32 = 3
    private let kRestartRate:UInt32 = 25
    
    init(positionX:CGFloat, positionY:CGFloat)
    {
        let addedDelta:CGFloat = CGFloat(arc4random_uniform(KStepAddedDelta))
        stepDelta = kStepMinDelta - addedDelta
        
        self.positionX = positionX
        self.positionY = positionY
        maxPositionY = positionY
    }
    
    //MARK: public
    
    func step()
    {
        positionY += stepDelta
        
        if positionY < 0
        {
            let restartRate:UInt32 = arc4random_uniform(kRestartRate)
            
            if restartRate == 0
            {
                positionY = maxPositionY
            }
        }
    }
}
