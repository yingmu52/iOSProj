//
//  Storyboard.swift
//  Connections
//
//  Created by Xinyi Zhuang on 08/02/2018.
//  Copyright © 2018 FBApps. All rights reserved.
//

import Foundation

enum Storyboard: String {
  case Main
  case Question

  func instantiate<T: UIViewController>(_ viewController: T.Type) -> T {
    print("inside instantiate")
    guard let vc = UIStoryboard(name: self.rawValue, bundle: nil)
      .instantiateViewController(withIdentifier: T.storyboardID) as? T else {
      fatalError("Couldn't instantiate \(T.storyboardID) from \(self.rawValue)")
    }
    return vc
  }

  var initialViewController: UIViewController {
    guard let vc = UIStoryboard(name: self.rawValue, bundle: nil).instantiateInitialViewController() else {
      fatalError("There should be at least one view controller in a storyboard file")
    }
    return vc
  }
}

extension UIViewController {
  static var storyboardID: String {
    print("after ext")
    return description().components(separatedBy: ".").dropFirst().joined()
  }
}
