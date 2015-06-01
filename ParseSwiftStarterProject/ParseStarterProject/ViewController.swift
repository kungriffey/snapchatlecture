//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

  @IBOutlet weak var userNameTextField: UITextField!
  @IBAction func submitButtonPressed(sender: AnyObject) {
    //  Login User
    PFUser.logInWithUsernameInBackground(self.userNameTextField.text, password: "myPass") { (user:PFUser?, error:NSError?) -> Void in
      
      if user != nil {
        println("The user is logged in")
      }
      else
      {
        println("Login Failed")
      }
      
    }
  }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

