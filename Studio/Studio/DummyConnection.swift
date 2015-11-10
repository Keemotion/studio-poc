
import Foundation
import UIKit

class DummyConnection: NSObject {
 
    var imageChanged:(UIImage)->Void = {
        (image:UIImage) -> Void in
    }
    
    var timer: NSTimer?

    init(url: NSURL) {
        super.init()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: Selector("sendDummyImage"), userInfo: nil, repeats: true)
    }
    
    func sendDummyImage()  {
        let images = [
            UIImage(named: "pat1")!,
            UIImage(named: "pat2")!,
            UIImage(named: "pat3")!,
            UIImage(named: "pat4")!,
        ]
        let image = images[Int(arc4random_uniform(4))]
        
        imageChanged(image)
    }
    
}