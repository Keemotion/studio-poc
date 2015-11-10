
import Foundation
import UIKit

class VideoView: UIButton, NSURLConnectionDataDelegate {
    
    //let url = NSURL(fileURLWithPath: "http://localhost:1337/mjpeg_stream")
    
    private var data = NSMutableData()
    
    var videoURL: NSURL! {
        didSet {
            let request = NSURLRequest(URL: videoURL)
            
            NSURLConnection(request: request, delegate: self)
        }
    }
    
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        // put through data
        if let mjpegImage = UIImage(data: data) {
            imageView?.image = mjpegImage
            setImage(mjpegImage, forState: .Normal)
        }
        // reset data
        self.data.length = 0
    }
    
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        self.data.appendData(data)
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
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        print(error.localizedDescription)
    }
}