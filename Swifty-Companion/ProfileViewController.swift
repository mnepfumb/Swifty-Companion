//
//  ProfileViewController.swift
//  Swifty-Companion
//
//  Created by Mashudu NEPFUMBADA on 2018/10/18.
//  Copyright © 2018 Mashudu NEPFUMBADA. All rights reserved.
//

import UIKit
import SwiftyJSON


class ProfileViewController: UIViewController
{
    let apiAuth = API42Connector()
    var jsonData: JSON?

    @IBOutlet weak var displayNameLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var levelLbl: UILabel!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var mobileLbl: UILabel!
    @IBOutlet weak var correctionLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.jsonData = GlobalJsonData.jsonManager.json
        print(GlobalJsonData.jsonManager.json!)
        print(self.jsonData!)
        displayNameLbl.text = apiAuth.displayName
        //print("Profile name: \((String).self.apiAuth.displayName)")
        
    }
    
    

}
