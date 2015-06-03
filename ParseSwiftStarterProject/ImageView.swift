//
//  ImageView.swift
//  ParseStarterProject
//
//  Created by Kunwardeep Gill on 2015-06-03.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit

class ImageView: UIImageView {

  
  
  
  func createImageView(viewSize:CGRect, colour:UIColor, alphaValue:CGFloat, tagValue:Int) -> UIImageView {
    
    var backgroundView = UIImageView(frame: viewSize)
    backgroundView.backgroundColor = colour
    backgroundView.alpha = alphaValue
    backgroundView.tag = tagValue
    return backgroundView
  }
  
  
  func createImageView(viewSize:CGRect, colour:UIColor, alphaValue:CGFloat, tagValue:Int, image:UIImage) -> UIImageView {
    var backgroundView = UIImageView(frame: viewSize)
    backgroundView.backgroundColor = colour
    backgroundView.alpha = alphaValue
    backgroundView.tag = tagValue
    backgroundView.image = image
    return backgroundView
  }
  
  
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
