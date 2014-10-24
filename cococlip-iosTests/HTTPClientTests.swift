//
//  HTTPClientTests.swift
//  cococlip-ios
//
//  Created by Yu Nakanishi on 2014/10/18.
//  Copyright (c) 2014年 Yu Nakanishi. All rights reserved.
//

import UIKit
import XCTest

class HTTPClientTests: XCTestCase {
    func test_JSONから値を取り出せる() {
        let url: NSURL = NSURL(string: "https://qiita.com/api/v1/users/youcune")
        let json: AnyObject? = HTTPClient.getJson(url)
        let url_name: String = (json as NSDictionary)["url_name"] as String
        XCTAssertEqual(url_name, "youcune")
    }

    func test_JSONではないときはnilが返る() {
        let url: NSURL = NSURL(string: "http://qiita.com/youcune")
        let json: AnyObject? = HTTPClient.getJson(url)
        XCTAssertNil(json)
    }
}
