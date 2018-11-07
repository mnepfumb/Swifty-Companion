//
//  SkillsTabViewController.swift
//  Swifty-Companion
//
//  Created by _root on 2018/10/20.
//  Copyright © 2018 Mashudu NEPFUMBADA. All rights reserved.
//

import UIKit
import SwiftyJSON

class SkillsTabViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return JSON(ViewController.jsonData!)["cursus_users"][0]["skills"].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SkillsTableViewCell
        
        let skill: String = JSON(ViewController.jsonData!)["cursus_users"][0]["skills"][indexPath.row]["name"].stringValue
        let level: Double  = Double(JSON(ViewController.jsonData!)["cursus_users"][0]["skills"][indexPath.row]["level"].stringValue)!
        
        UIView.animate(withDuration: 1)
        {
            cell!.progressBar.value = CGFloat(level)
        }
        cell!.textLabel?.text = skill
        cell!.detailTextLabel?.text = " "
        
        return cell!
    }
}
