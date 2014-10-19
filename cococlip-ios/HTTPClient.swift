//
//  HTTPClient.swift
//  cococlip
//
//  Created by Yu Nakanishi on 2014/10/16.
//  Copyright (c) 2014年 Yu Nakanishi. All rights reserved.
//

import Foundation

class HTTPClient {
    class func GetJsonByNSURL(url: NSURL) -> AnyObject? {
        var request = NSURLRequest(URL: url)
        var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?> = nil
        var error: AutoreleasingUnsafeMutablePointer<NSErrorPointer?> = nil
        var data: NSData = NSURLConnection.sendSynchronousRequest(request, returningResponse: response, error:nil)!
        var object: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil)
        return object
    }
}
