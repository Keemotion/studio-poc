
import Foundation
import UIKit

class VideoView: UIButton, NSURLConnectionDataDelegate {
    
    let url = NSURL(fileURLWithPath: "http://localhost:1337/mjpeg_stream")
    
    private var data = NSMutableData()

    weak var connection : NSURLConnection?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        //let image: UIImage = UIImage(imageLiteral: "dd")
        
        let request = NSURLRequest(URL: url)
        
        connection = NSURLConnection(request: request, delegate: self)
        
        if let c = connection {
            c.start()
            print("lll")
        }
    }
    
    
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        // put through data
        if let mjpegImage = UIImage(data: data) {
            imageView?.image = mjpegImage
            print("hello")
        }
        print("hello2")
        // reset data
        self.data.length = 0
    }
    
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        self.data.appendData(data)
        print("hello3")
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        print(error.localizedDescription)
    }
}