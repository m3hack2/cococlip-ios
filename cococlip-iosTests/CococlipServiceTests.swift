//
//  CococlipService.swift
//  cococlip-ios
//
//  Created by Yu Nakanishi on 2014/10/20.
//  Copyright (c) 2014年 Yu Nakanishi. All rights reserved.
//

import UIKit
import XCTest
import CoreLocation

class CococlipServiceTests: XCTestCase {
    func test_APIをコールしClipの配列が返る() {
        let location: CLLocation = CLLocation(latitude: 139.766103, longitude: 35.681391)
        let clips = CococlipService.getClipsBy(location)
        XCTAssertNotNil(clips)
    }
}
