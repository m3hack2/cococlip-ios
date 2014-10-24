//
//  ClipCell.swift
//  cococlip-ios
//
//  Created by Yu Nakanishi on 2014/10/23.
//  Copyright (c) 2014年 Yu Nakanishi. All rights reserved.
//

import UIKit
import Foundation

class ClipCell: UITableViewCell, NSURLConnectionDelegate {
    init (clip: Clip) {
        super.init(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "ClipCell")
        
        NSLog("Rendering Clip: \(clip.title!)")
        
        self.textLabel?.text = clip.title!
        
        // 非同期通信開始
        let request = NSURLRequest(URL: NSURL(string: clip.low_image1_url!))
        let connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: true)
        connection.start()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 読み込みが終わったら UIImageView を差し替え
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!) {
        self.imageView?.image = UIImage(data: data)
        
        // 再描画指示
        self.setNeedsLayout()
    }
}
