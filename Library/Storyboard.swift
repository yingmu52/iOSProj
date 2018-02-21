//
//  Storyboard.swift
//  Connections
//
//  Created by Xinyi Zhuang on 08/02/2018.
//  Copyright © 2018 FBApps. All rights reserved.
//

import Foundation
import Snakepit

enum Storyboard: String, StoryboardGettable {
  case Main
  case Question

  var bundle: Bundle? {
    return Bundle.main
  }
}
