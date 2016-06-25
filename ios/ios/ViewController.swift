//
//  ViewController.swift
//  ios
//
//  Created by Chanintorn Asavavichairoj on 6/25/2559 BE.
//  Copyright © 2559 JO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var service = Services.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        service.getToday { (data, error) in
            if let today = data?["today"] as? String {
                self.dateLabel.text = today
            }
        }
    }
    
    @IBAction func loginButtonDidPressed(sender: AnyObject) {
        if let username = usernameTextfield.text,
            password = passwordTextfield.text {
            service.login(username, password: password, callback: { (data, error) in
                if let result = data?["result"] as? Bool {
                    if result {
                        self.performSegueWithIdentifier("gotoMain", sender: nil)
                    } else {
                        self.showAlert("Login", message: "Invalid Username or Password")
                    }
                }
            })
        }
    }
    
    func showAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let okButton = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(okButton)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func caculateData() -> Int {
        return 2
    }

}