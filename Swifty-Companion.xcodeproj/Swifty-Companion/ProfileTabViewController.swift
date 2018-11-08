//
//  ProfifeTabViewController.swift
//  Swifty-Companion
//
//  Created by _root on 2018/10/20.
//  Copyright © 2018 Mashudu NEPFUMBADA. All rights reserved.
//

import UIKit
import SwiftyJSON
import MBCircularProgressBar

class ProfileTabViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (JSON(ViewController.jsonData!)["projects_users"].count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProfileTableViewCell

        let subject: String = JSON(ViewController.jsonData!)["projects_users"][indexPath.row]["project"]["name"].stringValue
        let marks: String = JSON(ViewController.jsonData!)["projects_users"][indexPath.row]["project"]["slug"].stringValue
        let level = JSON(ViewController.jsonData!)["projects_users"][indexPath.row]["final_mark"].stringValue
        
        cell!.detailTextLabel?.text = String(marks)
        cell!.textLabel?.text = subject
        if level != ""
        {
            UIView.animate(withDuration: 1)
            {
                cell!.progressBar.value = CGFloat(Double(level)!)
            }
        }
        else
        {
            UIView.animate(withDuration: 1)
            {
                cell!.progressBar.value = CGFloat(0)
            }
        }
        return cell!
    }
}
