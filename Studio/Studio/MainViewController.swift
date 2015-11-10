
import Foundation
import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var previewVideoView: VideoView!
    @IBOutlet weak var onAirVideoView: VideoView!
    @IBOutlet var cameraVideoViews: [VideoView]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onAirVideoView.title = "fdsfsf"
        previewVideoView.title = "fdsfsf"
        previewVideoView.videoURL = "http://10.3.10.34:1337/mjpeg_stream"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func cameraSelected(sender: VideoView) {
        
    }
}

