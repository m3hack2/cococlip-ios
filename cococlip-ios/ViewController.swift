//
//  ViewController.swift
//  cococlip-ios
//
//  Created by Yu Nakanishi on 2014/10/18.
//  Copyright (c) 2014年 Yu Nakanishi. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    var clips: [Clip] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // ---------------------------------------------------------------
    // 位置情報関連
    // ---------------------------------------------------------------
    var manager: CLLocationManager!
    func getLocation () {
        manager = CLLocationManager()
        manager.delegate = self
        
        if(CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse) {
            manager.requestAlwaysAuthorization()
        }
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.distanceFilter = 100
        manager.startUpdatingLocation()
    }
    
    // 状態変化
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        println("CLAuthorizationStatus: \(status)")
    }
    
    // 成功
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!){
        clips = CococlipService.getClipsBy(manager.location)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // 失敗
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!){
        // TODO
        println("ERROR")
    }

    // ---------------------------------------------------------------
    // Clips 一覧表示の TableView 関連
    // ---------------------------------------------------------------
    @IBOutlet weak var tableView: UITableView!

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int  {
        return clips.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = clips[indexPath.row].title!
        return cell
    }
    
    func tableView(tableView: UITableView?, didSelectRowAtIndexPath indexPath:NSIndexPath!) {
        var text: String = clips[indexPath.row].title!
        println(text)
    }
}
