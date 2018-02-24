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

  override func viewDidLoad() {
    super.viewDidLoad()
    let selectionViewController = Storyboard.Question.get(PageViewController.self)
    addChildViewController(selectionViewController)
  }


}
