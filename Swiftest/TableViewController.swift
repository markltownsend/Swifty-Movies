//
//  TableViewController.swift
//  Swiftest
//
//  Created by Mark on 6/2/14.
//  Copyright (c) 2014 Mark. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var searchTextField : UITextField
    var myArray: NSArray
    var networkManager : NetworkManager

    init(style: UITableViewStyle) {
        networkManager = NetworkManager()
        myArray = []
        super.init(style: style)
    }

    init(coder aDecoder: NSCoder!) {
        networkManager = NetworkManager()
        myArray = []
        super.init(coder: aDecoder)
    }

    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movies"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func searchTapped(sender : UIButton) {
        searchTextField.resignFirstResponder()
        let searchString = searchTextField.text
        title = "Loading..."
        networkManager.searchTitle(searchString, {
            response, error in
            println("done loading")
            self.title = "Movies"
            self.myArray = response as NSArray
            self.tableView.reloadData()

        })
    }
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!)
    {
            let controller = segue.destinationViewController as DetailViewController
            var cell = sender as UITableViewCell
            controller.label = cell.textLabel.text
    }
    // #pragma mark - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.myArray.count
    }

    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
        let cell = tableView!.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell!
        var row: Int?
        if (indexPath) {
            row = indexPath?.row
        }
        let dict = myArray[row!] as NSDictionary
        cell.textLabel.text = dict["title"] as String

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView?, canEditRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView?, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath?) {
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
    override func tableView(tableView: UITableView?, moveRowAtIndexPath fromIndexPath: NSIndexPath?, toIndexPath: NSIndexPath?) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView?, canMoveRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
