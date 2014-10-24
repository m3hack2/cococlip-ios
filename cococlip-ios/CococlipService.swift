//
//  CococlipService.swift
//  cococlip-ios
//
//  Created by Yu Nakanishi on 2014/10/20.
//  Copyright (c) 2014年 Yu Nakanishi. All rights reserved.
//

import Foundation
import CoreLocation

private let CLIPS_ENDPOINT = "https://cococlip.herokuapp.com/api/1/clips"

public class CococlipService {
    class func getClipsBy(location: CLLocation) -> [Clip] {
        var clips: [Clip] = []
        let params: Dictionary<String, String> = [
            "lat": "\(location.coordinate.latitude)",
            "lon": "\(location.coordinate.longitude)"
        ]
        let endpoint: NSURL = NSURL(string: "\(CLIPS_ENDPOINT)?\(buildParameters(params))")
        let json: AnyObject? = HTTPClient.getJson(endpoint)
        
        if let jsonDic = json as? NSDictionary{
            if let results = jsonDic["results"] as? NSArray{
                for result in results {
                    let result: NSDictionary = result as NSDictionary
                    clips.append(Clip(dic: result))
                }
            }
        }

        return(clips)
    }
    
    /**
     * Dictionary から QueryString を返す
     */
    class func buildParameters(dic: Dictionary<String, String>) -> String {
        var query: String = ""

        for (key, value) in dic {
            query += "&\(key)=\(value)"
        }
        
        return(query.substringFromIndex(advance(query.startIndex, 1)))
    }
}
