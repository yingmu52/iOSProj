//
//  QuestionViewController.swift
//  Connections
//
//  Created by Xinyi Zhuang on 08/02/2018.
//  Copyright © 2018 FBApps. All rights reserved.
//

import UIKit

final class QuestionViewController: UIViewController {
  @IBOutlet var imageView1: UIImageView!
  @IBOutlet var imageView2: UIImageView!
  @IBOutlet var imageView3: UIImageView!
  @IBOutlet var imageView4: UIImageView!
  @IBOutlet var questionLabel: UILabel!

  @IBAction func buttonPressed(_ sender: UIImageView) {
    switch sender.tag {
    case 0:
      print("tag 0")
    case 1:
      print("tag 1")
    case 2:
      print("tag 2")
    case 3:
      print("tag 3")
    default:
      return
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    // initialize view
    questionLabel.text = nil
    imageView1.image = nil
    imageView2.image = nil
    imageView3.image = nil
    imageView4.image = nil

    // TODO: Fetch and Display Data
  }
}
