//
//  User.swift
//  ParseStarterProject
//
//  Created by Kunwardeep Gill on 2015-06-02.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class User: PFUser, PFSubclassing {
  
 override init() {
    super.init()
  }
  // create an override
  convenience init(name:String!, pass:String!) {
    self.init()
    PFUser.logOut()
    self.username = name
    self.password = pass
    self.createANewUser(self.username!, password:self.password!)
  }

  func createANewUser(userName:String,password:String) {
    //  Login User
    PFUser.logInWithUsernameInBackground(userName ,password:password) {
      (user: PFUser?, error: NSError?) -> Void in
      
      if user != nil {
        println("The user is logged in")
        // self.performSegueWithIdentifier("showUsers", sender: self)
      }
      else
      {
        println("Login Failed")
        //  Set up a new user if one does not exist
        var user = PFUser()
        user.username = userName
        user.password = password
        user.signUp()
        
        user.signUpInBackgroundWithBlock({ (succeeded:Bool, error:NSError?) -> Void in
          
          if error == nil {
            println("user signed up")
            //self.performSegueWithIdentifier("showUsers", sender: self)
          }
          else
          {
            println(error)
          }
        })
      }
    }

  }
  
}
