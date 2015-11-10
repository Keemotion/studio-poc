//
//  MJPEGBuffer.swift
//  Studio
//
//  Created by Ludovic Vannoorenberghe on 10/11/15.
//  Copyright © 2015 Keemotion. All rights reserved.
//

import Foundation
import UIKit


class MJPEGBuffer {
    
    let bufferSize = 100
    
    private var idx = 0
    
    private var delayedIdx = 0
    
    private var buffer: Array<UIImage>
    
    private var conn: MJPEGConnection
    
    private var timer: NSTimer?
    
    private var delayedHandler: UIImage -> Void = { _ in }
    
    init(connection: MJPEGConnection) {
        self.conn = connection
        let size = CGSize(width: 100, height: 100)
        let color = UIColor.blackColor()
        let rect = CGRectMake(0, 0, 100, 100)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.buffer = [UIImage](count: bufferSize, repeatedValue: image)
    }
    
    func playLive(withHandler handler: (UIImage -> Void)) {
        
        conn.start(withHandler: { image in
            //call the given handler
            handler(image)
            //record the img in the buffer
            self.buffer[self.idx] = image
            self.idx++
        })
    }
    
    func playDelayed(delay: Int, withHandler handler: UIImage -> Void) {
        if delay < bufferSize {
            var i = ((idx - delay) % bufferSize)
            i = i >= 0 ? i : bufferSize - i
            
            delayedIdx = i
            delayedHandler = handler
            timer = NSTimer(timeInterval: 1.0, target: self, selector: "callDelayedHandler:", userInfo: nil, repeats: true)
        }
    }
    
    func callDelayedHandler() {
        delayedHandler(buffer[delayedIdx++])
    }
    
    
}