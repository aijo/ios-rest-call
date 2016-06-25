//
//  TableViewController.swift
//  ios
//
//  Created by Chanintorn Asavavichairoj on 6/25/2559 BE.
//  Copyright © 2559 JO. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, AddItemDelegate {
    
    var itemList:[Item]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: #selector(TableViewController.addButtonDidPressed))
        self.navigationItem.rightBarButtonItem = addButton
        
        loadData()
    }

    func addButtonDidPressed() {
        self.performSegueWithIdentifier("gotoAddItem", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "gotoAddItem" {
            if let vc = segue.destinationViewController as? AddViewController {
                vc.delegate = self
            }
        }
    }
    
    func loadData() {
        Services.sharedInstance.getItems { (data, error) in
            self.itemList = data
            self.tableView.reloadData()
        }
    }
    
    // MARK: - AddItemDelegate
    
    func didSaved() {
        loadData()
    }
    
    func didCancel() {
    
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let itemList = itemList {
            return itemList.count
        }
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...
        let item = itemList?[indexPath.row]
        cell.textLabel?.text = item?.title

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
