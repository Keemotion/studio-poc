
import Foundation
import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var previewVideoView: VideoView!
    @IBOutlet weak var onAirVideoView: VideoView!
    @IBOutlet var cameraVideoViews: [VideoView]! {
        didSet {
            for (i,v) in cameraVideoViews.enumerate() {
                v.videoConnection?.start(withHandler: { (image:UIImage) -> Void in
                    dispatch_async(dispatch_get_main_queue(),{
                        v.setImage(image, forState: .Normal)
                        if i == self.previewCamera { self.previewVideoView.setImage(image, forState: .Normal)}
                        if i == self.onAirCamera { self.onAirVideoView.setImage(image, forState: .Normal)}
                    })
                })
            }
        }
    }
    
    var onAirCamera: Int?  {
        didSet {
            if onAirCamera != oldValue {
                reconfigureCameraFrameColor()
            }
        }
    }

    var previewCamera: Int? {
        didSet {
            if previewCamera != oldValue {
                reconfigureCameraFrameColor()
            }
        }
    }
    
    func reconfigureCameraFrameColor() {
        for (i,v) in cameraVideoViews.enumerate() {
            if self.onAirCamera == i {
                v.frameColor = onAirVideoView.color
            }
            else if self.previewCamera == i {
                v.frameColor = previewVideoView.color
            }
            else {
                v.frameColor = nil
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func goOnAir() {
        if let cameraIdx = previewCamera {
            onAirCamera = cameraIdx
        }
    }
    
    @IBAction func cameraSelected(sender: VideoView) {
        if let cameraIdx = cameraVideoViews.indexOf(sender), let _ = sender.videoConnection {
            previewCamera = cameraIdx
        }
        
    }
    @IBAction func previewToOnAirPressed(sender: AnyObject) {
        goOnAir()
    }
}

