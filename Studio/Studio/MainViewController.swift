
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
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func cameraSelected(sender: VideoView) {
        
    }
}

