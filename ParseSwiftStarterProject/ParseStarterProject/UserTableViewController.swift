//
//  UserTableViewController.swift
//  ParseStarterProject
//
//  Created by Kunwardeep Gill on 2015-06-01.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class UserTableViewController: UITableViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
  
  var userArray:[String] = []
  var activeUser = 0
  var messageCount = 0
  //  timerVariable
  var timer = NSTimer()
  
  //  image picker controller
  func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
    
    self.dismissViewControllerAnimated(true, completion: nil)
    //  upload to parse
    var imageSend = PFObject(className: "Image")
    imageSend["image"] = PFFile(name: "image.jpg", data: UIImageJPEGRepresentation(image, 0.5))
    imageSend["sender"] = PFUser.currentUser()?.username
    imageSend["receiver"] = userArray[activeUser]
    imageSend.save()
  }
  
  //  Selecting an Image from the Photo Library
  func  pickImage(sender:AnyObject) {
    var image = UIImagePickerController()
    image.delegate = self
    //image.sourceType = UIImagePickerControllerSourceType.Camera
    image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    image.allowsEditing = false
    self.presentViewController(image, animated: true, completion: nil)
  }

    override func viewDidLoad() {
        super.viewDidLoad()
      
        var query = PFUser.query()
        query?.whereKey("username", notEqualTo: PFUser.currentUser()!.username!)
        var users = query?.findObjects()
        if let testUser = users {
          for user in users! {
            println(user.username)
            //  reload the tableView
            tableView.reloadData()
          }
        }
      
        // Use Timer for reloading image
      
      
      timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("checkForMessages"), userInfo: nil, repeats: true)
      
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
  
  func checkForMessages() {
    println("Checking for messages")
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return userArray.count
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell


      cell.textLabel?.text = userArray[indexPath.row]
      
      
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
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
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
