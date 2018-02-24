//
//  SelectionViewController.swift
//  Connections
//
//  Created by Xinyi Zhuang on 23/02/2018.
//  Copyright © 2018 FBApps. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {

  @IBAction func buttonPressed(_ sender: UIButton) {
    guard let optionView = sender.superview as? OptionView else { return }
    let selectedImage = #imageLiteral(resourceName: "Icon")
    let defaultImage = #imageLiteral(resourceName: "ldt_logo")
    optionView.heartImageView.image = sender.isSelected ? selectedImage : defaultImage
    sender.isSelected = !sender.isSelected
    print(sender.tag)
  }
}

class OptionView: UIView {
  @IBOutlet var heartImageView: UIImageView!
  @IBOutlet var button: UIButton!
}
