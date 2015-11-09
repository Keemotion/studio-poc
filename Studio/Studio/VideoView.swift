
import Foundation
import UIKit

class VideoView: UIButton {

    func setVideoURL(url: NSURL) {
        let textView = UILabel(frame: self.bounds)
        textView.text = url.absoluteString;
        textView.textAlignment = .Center
        textView.backgroundColor = UIColor.blueColor()
        self.addSubview(textView)
    }
    
    func setTitle(title: String, color: UIColor) {
        let textView = UILabel(frame: CGRect(origin: CGPoint(x: 3, y: 3), size: CGSize(width: 5, height: 5)))
        textView.text = title
        textView.backgroundColor = color
        textView.textAlignment = .Center
        textView.font = UIFont.systemFontOfSize(10)
        textView.textColor = UIColor.whiteColor()
        textView.sizeToFit()
        textView.frame = CGRectApplyAffineTransform(textView.frame, CGAffineTransformMakeScale(1.5, 1.5))
        addSubview(textView)
    }
    
    func setFrameColor(color: UIColor) {
        layer.borderWidth = 2.0
        layer.borderColor = color.CGColor
    }
    
}