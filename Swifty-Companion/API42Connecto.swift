//
//  API42ConnectorViewController.swift
//  Swifty-Companion
//
//  Created by Mashudu NEPFUMBADA on 2018/10/18.
//  Copyright © 2018 Mashudu NEPFUMBADA. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API42Connector: UIViewController {

    let client_id = "80dd41239839dc4e57c7b8023ffc005490671410e91c4eef32f66c95791e6f30"
    let client_secret = "4b41b6cf750090c3a89ee156309d95f6566afed449b2c1e36db0df33122d9911"
    var token = String()
    
    var displayName = String()
    var username = String()
    var level = String()
    var email = String()
    var correctionPoints = String()
    var mobile = String()
    var location = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func check_Token()
    {
        let url = NSURL(string: "https://api.intra.42.fr/oauth/token")
        let request = NSMutableURLRequest(url: url! as URL)
        request.httpMethod = "GET"
        request.setValue("Bearer \(self.token)", forHTTPHeaderField: "Authorization")
        
        Alamofire.request(request as URLRequest).validate().responseJSON
        {
            response in
            switch response.result
            {
                case .success(let value):
                    let json = JSON(value)
                    print(json["expres_in_seconds"])
                case .failure(let error):
                    print(error)
                    print("Getting a new Token")
                    self.token = ""
                    self.get_Token()
            }
        }
    }
    
    func get_Token()
    {
        let parameters = ["client_id": client_id,
                          "client_secret": client_secret,
                          "grant_type": "client_credentials"]
        let url = URL(string: "https://api.intra.42.fr/oauth/token")
        if self.token == ""
        {
            Alamofire.request(url!, method: .post, parameters: parameters).validate().responseJSON
            {
                response in
                switch response.result
                {
                    case .success(let value):
                        let json = JSON(value)
                        self.token = json["access_token"].stringValue
                        print("Token Generated")
                    case .failure(let error):
                        print(error)
                        self.token = ""
                        self.get_Token()
                    
                }
            }
        }
        else
        {
            self.check_Token()
        }
    }
    
    func get_UserInfo(user: String, completion: @escaping (JSON?) -> Void)
    {
        let url = NSURL(string: "https://api.intra.42.fr/v2/users/" + user)
        let request = NSMutableURLRequest(url: url! as URL)
        request.httpMethod = "GET"
        request.setValue("Bearer \(self.token)", forHTTPHeaderField: "Authorization")
        
        Alamofire.request(request as URLRequest).validate().responseJSON
        {
            response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                 print(json)
                completion(json)
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
        
    }

}
