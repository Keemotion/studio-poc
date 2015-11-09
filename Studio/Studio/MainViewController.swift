
import Foundation
import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var previewVideoView: VideoView!
    @IBOutlet weak var onAirVideoView: VideoView!
    @IBOutlet var cameraVideoViews: [VideoView]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = NSURL(string: "http://localhost.../") {
            onAirVideoView.setVideoURL(url)
        }
        onAirVideoView.setTitle("Live", color: UIColor.redColor())
        
        for (index,videoView) in cameraVideoViews.enumerate() {
            videoView.setTitle("test \(index)", color: UIColor.blackColor())
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

