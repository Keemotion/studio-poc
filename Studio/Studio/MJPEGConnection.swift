//
//  MJPEGConnectionDelegate.swift
//  Studio
//
//  Created by Ludovic Vannoorenberghe on 10/11/15.
//  Copyright © 2015 Keemotion. All rights reserved.
//

import Foundation
import UIKit

class MJPEGConnection: NSObject, NSURLConnectionDataDelegate {
    
    private let url: NSURL
    
    private var data = NSMutableData()
    
    private var connection: NSURLConnection?
    
    private var imageChanged: UIImage -> Void = { _ in }

    let queue: dispatch_queue_t = dispatch_queue_create("camera_capture \(arc4random_uniform(999))", nil)
    
    init(url: NSURL) {
        self.url = url
        super.init()
        
        let request = NSURLRequest(URL: url)
        
        self.connection = NSURLConnection(request: request, delegate: self, startImmediately: false)
    }
    
    func start(withHandler handler: UIImage -> Void) {
        self.imageChanged = handler
        self.connection?.start()
    }
    
    func stop() {
        self.connection?.cancel()
    }
    
    func start() {
        self.connection?.start()
    }
    
    
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        
        dispatch_async(self.queue, {
            
            // put through data
            if let mjpegImage = UIImage(data: self.data) {
                self.imageChanged(mjpegImage)
            }
            // reset data
            self.data = NSMutableData()

        });
    }
    
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        dispatch_async(self.queue, {
            self.data.appendData(data)
        })
    }
    
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        print(error.localizedDescription)
    }

    
}