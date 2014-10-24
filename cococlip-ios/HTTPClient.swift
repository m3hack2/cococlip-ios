//
//  HTTPClient.swift
//  cococlip
//
//  Created by Yu Nakanishi on 2014/10/16.
//  Copyright (c) 2014年 Yu Nakanishi. All rights reserved.
//

import Foundation

class HTTPClient {
    class func getJson(url: NSURL) -> AnyObject? {
        let data: NSData = getData(url)
        let object: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil)
        return object
    }
    
    class func getData(url: NSURL) -> NSData {
        let request = NSURLRequest(URL: url)
        let response: AutoreleasingUnsafeMutablePointer<NSURLResponse?> = nil
        let error: AutoreleasingUnsafeMutablePointer<NSErrorPointer?> = nil
        let data: NSData = NSURLConnection.sendSynchronousRequest(request, returningResponse: response, error:nil)!
        return(data)
    }
}
