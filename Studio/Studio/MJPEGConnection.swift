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
        // put through data
        if let mjpegImage = UIImage(data: data) {
            imageChanged(mjpegImage)
        }
        // reset data
        self.data.length = 0
    }
    
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        self.data.appendData(data)
    }
    
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        print(error.localizedDescription)
    }

    
}