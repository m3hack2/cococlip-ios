//
//  Clip.swift
//  cococlip-ios
//
//  Created by Yu Nakanishi on 2014/10/20.
//  Copyright (c) 2014年 Yu Nakanishi. All rights reserved.
//

import CoreLocation
import Foundation

class Clip {
    var id: String?
    var title: String?
    var location: CLLocation?
    var low_image1_url: NSURL?
    var high_image1_url: NSURL?
    var low_image2_url: NSURL?
    var high_image2_url: NSURL?
    
    init(dic: NSDictionary) {
        self.id = dic["_id"] as? String
        self.title = dic["title"] as? String
        
        if let loc = dic["loc"] as? NSDictionary {
            let lat = loc["lat"] as? Double
            let lon = loc["lon"] as? Double
            self.location = CLLocation(latitude: lat!, longitude: lon!)
        }

        if let low_image1_url_str = dic["low_image1_url"] as? String {
            self.low_image1_url = NSURL(string: low_image1_url_str)
        }
        if let high_image1_url_str = dic["high_image1_url"] as? String {
            self.high_image1_url = NSURL(string: high_image1_url_str)
        }
        if let low_image2_url_str = dic["low_image2_url"] as? String {
            self.low_image2_url = NSURL(string: low_image2_url_str)
        }
        if let high_image2_url_str = dic["high_image2_url"] as? String {
            self.high_image2_url = NSURL(string: high_image2_url_str)
        }
    }
}
