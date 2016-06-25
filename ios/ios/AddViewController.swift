//
//  AddViewController.swift
//  ios
//
//  Created by Chanintorn Asavavichairoj on 6/25/2559 BE.
//  Copyright © 2559 JO. All rights reserved.
//

import UIKit
import PKHUD

protocol AddItemDelegate {
    func didSaved()
    func didCancel()
}

class AddViewController: UIViewController {

    @IBOutlet weak var titleTextfield: UITextField!
    @IBOutlet weak var contentTextview: UITextView!
    
    let service = Services.sharedInstance
    var delegate: AddItemDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func saveButtonDidPressed(sender: AnyObject) {
        if let title = titleTextfield.text,
            content = contentTextview.text {
            HUD.show(.Progress)
            Services.sharedInstance.addItem(title, content: content, callback: { (data, error) in
                HUD.hide()
                if let result = data?["result"] as? Bool {
                    if result {
                        self.delegate?.didSaved()
                        self.dismissViewControllerAnimated(true, completion: nil)
                    } else {
                        self.showAlert("Add Item", message: "Error occure!")
                    }
                }
            })
        }
    }
    
    @IBAction func cancelButtonDidPressed(sender: AnyObject) {
        self.delegate?.didCancel()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func showAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let okButton = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(okButton)
        self.presentViewController(alert, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
