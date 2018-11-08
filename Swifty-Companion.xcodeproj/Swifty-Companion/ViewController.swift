//
//  ViewController.swift
//  Swifty-Companion
//
//  Created by Mashudu NEPFUMBADA on 2018/10/16.
//  Copyright © 2018 Mashudu NEPFUMBADA. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    let apiAuth = API42Connector()
    static var jsonData: JSON?
    
    @IBOutlet weak var userTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiAuth.check_Token()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func viewUserBtn(_ sender: Any)
    {
        let profileView = ProfileVController()
        if userTextField.text != ""
        {
            let userTEXT = (userTextField.text!.trimmingCharacters(in: .whitespaces)).lowercased()
            apiAuth.get_UserInfo(user: userTEXT)
            {
                completion in
                if completion != nil
                {
                    ViewController.jsonData = completion
                    profileView.jsonData = completion
                    
                    if let vc: TabBarViewController = self.storyboard?.instantiateViewController(withIdentifier: "tabBar") as? TabBarViewController {
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                }
                else
                {
                    print("error POP-UP HERE 1")
                    self.popUp()
                    self.userTextField.text = ""
                }
            }
        }
        else
        {
            print("error POP-UP HERE 2")
            self.popUp()
        }
    }
    
    func popUp()
    {
        var alert = UIAlertController()
        let message = "The username:  " + self.userTextField.text! + " was not found. Please try again..."
        if self.userTextField.text != ""
        {
            alert = UIAlertController(title: "Username Error", message: message, preferredStyle: .alert)
        }
        else
        {
            alert = UIAlertController(title: "Username Error", message: "The is a problem with the username you have entered. Please try again...", preferredStyle: .alert)
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}

