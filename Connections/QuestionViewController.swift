//
//  QuestionViewController.swift
//  Connections
//
//  Created by Xinyi Zhuang on 08/02/2018.
//  Copyright © 2018 FBApps. All rights reserved.
//

import UIKit

final class QuestionViewController: UIViewController {
  @IBOutlet var questionLabel: UILabel!

  @IBAction func buttonPressed(_ sender: UIButton) {
    switch sender.tag {
    case 1:
      print("tag 1")
    case 2:
      print("tag 2")
    case 3:
      print("tag 3")
    case 4:
      print("tag 4")
    default:
      return
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
