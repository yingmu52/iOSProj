//
//  AppDelegate.swift
//  Connections
//
//  Created by Felipe Ballesteros on 2018-01-08.
//  Copyright © 2018 FBApps. All rights reserved.
//

import UIKit
import FacebookCore
import FBSDKCoreKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    FBSDKApplicationDelegate.sharedInstance()
      .application(application, didFinishLaunchingWithOptions: launchOptions)

    return true
  }

  func application(_ app: UIApplication, open url: URL,
                   options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
    let handle = FBSDKApplicationDelegate
      .sharedInstance()
      .application(
        app,
        open: url,
        sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String,
        annotation: options[UIApplicationOpenURLOptionsKey.annotation]
    )
    return handle
  }
}

