//
//  ViewController.swift
//  cococlip-ios
//
//  Created by Yu Nakanishi on 2014/10/18.
//  Copyright (c) 2014年 Yu Nakanishi. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var clips: [Clip] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clips = CococlipService.getClipsBy(CLLocation(latitude: 22, longitude: 22))
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
