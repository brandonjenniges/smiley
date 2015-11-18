//
//  Copyright © 2015 Brandon Jenniges. All rights reserved.
//

import UIKit

@IBDesignable
class SmileyFace: UIView {
    
    enum Expression {
        case Happy
        case Sad
        case Bored
    }
    
    var expression: Expression = .Bored
    var minY: CGFloat = 150
    var baseY: CGFloat = 175
    var maxY: CGFloat = 200
    
    var currentY: CGFloat = 175
    
    override func drawRect(rect: CGRect) {
        switch expression {
        case .Happy:
            Smiley.drawHappyFace(number: currentY)
            break
        case .Sad:
            Smiley.drawHappyFace(number: currentY)
            break
        case .Bored:
            Smiley.drawHappyFace(number: currentY)
            break
        }
    }
}
