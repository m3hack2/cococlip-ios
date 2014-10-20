//
//  Clip.swift
//  cococlip-ios
//
//  Created by Yu Nakanishi on 2014/10/20.
//  Copyright (c) 2014年 Yu Nakanishi. All rights reserved.
//

import Foundation

class Clip {
    var id: String?
    var title: String?
    var lat: Double?
    var lon: Double?
    var low_image1_url: String?
    var high_image1_url: String?
    var low_image2_url: String?
    var high_image2_url: String?
    
    init(dic: NSDictionary) {
        self.id = dic["id"] as? String
        self.title = dic["title"] as? String
        self.lat = dic["lat"] as? Double
        self.lon = dic["lon"] as? Double
        self.low_image1_url = dic["low_image1_url"] as? String
        self.high_image1_url = dic["high_image1_url"] as? String
        self.low_image2_url = dic["low_image2_url"] as? String
        self.high_image2_url = dic["high_image2_url"] as? String
    }
}
