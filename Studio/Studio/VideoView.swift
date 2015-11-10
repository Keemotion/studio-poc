
import Foundation
import UIKit

@IBDesignable class VideoView: UIButton, NSURLConnectionDataDelegate {
    
    
    private var data = NSMutableData()
    
    var titleLabelView : UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        let labelView = UILabel(frame: CGRect(origin: CGPoint(x: 3, y: 3), size: CGSize(width: 5, height: 5)))
        labelView.backgroundColor = color
        labelView.textAlignment = .Center
        labelView.font = UIFont.systemFontOfSize(10)
        labelView.textColor = UIColor.whiteColor()
        labelView.text = title
        labelView.sizeToFit()
        labelView.frame = CGRectApplyAffineTransform(labelView.frame, CGAffineTransformMakeScale(1.5, 1.5))
        addSubview(labelView)
        bringSubviewToFront(labelView)
        titleLabelView = labelView
        backgroundColor = UIColor(white: 0.16, alpha: 1)
        
    }
    
    var videoConnection: MJPEGConnection?
   
    @IBInspectable
    var videoURL: String? {
        didSet {
            if let videoURLStr = videoURL, let url = NSURL(string: videoURLStr) {
                videoConnection = MJPEGConnection(url: url)
            }
        }
    }
  
    @IBInspectable
    var title: String = "" {
        didSet {
            if let labelView = titleLabelView {
                labelView.text = title
                labelView.sizeToFit()
                labelView.frame = CGRectApplyAffineTransform(labelView.frame, CGAffineTransformMakeScale(1.5, 1.5))
            }
        }
    }
    
    @IBInspectable
    var color: UIColor = UIColor.blackColor() {
        didSet {
            if let labelView = titleLabelView {
                labelView.backgroundColor = color
            }
        }
    }
    
    @IBInspectable
    var frameColor: UIColor? {
        didSet {
            if let c = frameColor {
                layer.borderWidth = 2.0
                layer.borderColor = c.CGColor
            }
            else {
                layer.borderWidth = 0
            }
        }
    }
}