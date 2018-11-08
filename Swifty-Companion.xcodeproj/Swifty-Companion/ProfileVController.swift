//
//  ProfileVController.swift
//  Swifty-Companion
//
//  Created by Mashudu NEPFUMBADA on 2018/10/19.
//  Copyright © 2018 Mashudu NEPFUMBADA. All rights reserved.
//

import UIKit
import SwiftyJSON
import MBCircularProgressBar

class ProfileVController: UIViewController
{
     var jsonData: JSON?
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var levelLbl: UILabel!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var correctionLbl: UILabel!
    @IBOutlet weak var profleImage: UIImageView!
    @IBOutlet weak var myLevel: MBCircularProgressBarView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.imageManager()
        
        profleImage.layer.cornerRadius = profleImage.frame.size.height / 2
        profleImage.clipsToBounds = true
        
        self.name.text = " \(JSON(ViewController.jsonData!)["displayname"].stringValue)"
        self.correctionLbl.text = "Corretion Points: \(JSON(ViewController.jsonData!)["correction_point"].stringValue)"
        self.emailLbl.text = "Email: \(JSON(ViewController.jsonData!)["email"].stringValue)"
        self.usernameLbl.text = "Username: \(JSON(ViewController.jsonData!)["login"].stringValue)"
        
        print("CHECK PROJECTS: ",JSON(ViewController.jsonData!)["projects_users"][0]["project"]["name"].stringValue)
        print("counter: ", JSON(ViewController.jsonData!)["projects_users"].count)
        
        let level = JSON(ViewController.jsonData!)["cursus_users"][0]["level"].stringValue
        UIView.animate(withDuration: 1)
        {
            self.myLevel.value = CGFloat(Double(level)!)
        }
    }
    
    func imageManager()
    {
        print(JSON(ViewController.jsonData!)["image_url"].stringValue)
        let imageUrl = JSON(ViewController.jsonData!)["image_url"].stringValue
        if let url = URL(string: imageUrl)
        {
            if let imageData = NSData(contentsOf: url)
            {
                self.profleImage.image = UIImage(data: imageData as Data)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
