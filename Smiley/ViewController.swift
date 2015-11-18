//
//  Copyright © 2015 Brandon Jenniges. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var smiley: SmileyFace!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func drawHappy(number: CGFloat)  {
        smiley.currentY = number
        if smiley.currentY < smiley.maxY {
            let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.02 * Double(NSEC_PER_SEC)))
            dispatch_after(delayTime, dispatch_get_main_queue()) {
                self.smiley.setNeedsDisplay()
                self.drawHappy(number + 1)
            }
        }
    }
    
    func drawSad(number: CGFloat)  {
        smiley.currentY = number
        if smiley.currentY > smiley.minY {
            let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.02 * Double(NSEC_PER_SEC)))
            dispatch_after(delayTime, dispatch_get_main_queue()) {
                self.smiley.setNeedsDisplay()
                self.drawSad(number - 1)
            }
        }
    }
    
    func drawBored(number: CGFloat)  {
        smiley.currentY = number
        if smiley.currentY > smiley.baseY {
            let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.02 * Double(NSEC_PER_SEC)))
            dispatch_after(delayTime, dispatch_get_main_queue()) {
                self.smiley.setNeedsDisplay()
                self.drawBored(number - 1)
            }
        } else if smiley.currentY < smiley.baseY {
            let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.02 * Double(NSEC_PER_SEC)))
            dispatch_after(delayTime, dispatch_get_main_queue()) {
                self.smiley.setNeedsDisplay()
                self.drawBored(number + 1)
            }
        }
    }

    @IBAction func makeHappyFace(sender: AnyObject) {
        smiley.expression = .Happy
        drawHappy(smiley.currentY)
    }
    
    @IBAction func makeSadFace(sender: AnyObject) {
        smiley.expression = .Sad
        drawSad(smiley.currentY)
    }
    
    @IBAction func makeBoredFace(sender: AnyObject) {
        smiley.expression = .Bored
        drawBored(smiley.currentY)
    }
    
}

