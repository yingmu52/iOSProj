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
import Parse


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    print("HEEERE")
  //  window?.rootViewController = Storyboard.Question.instantiate(QuestionViewController.self)
    FBSDKApplicationDelegate.sharedInstance()
      .application(application, didFinishLaunchingWithOptions: launchOptions)
    let configuration = ParseClientConfiguration {
        $0.applicationId = "JGL1SdJfjAv8QnNOiCp0omHgcxmPWgEmGaw5WiaU"
        $0.clientKey = "rxC26i0LBbN2qDBWblPaNBuK22S7rUMhCM5MGjkh"
        $0.server = "https://parseapi.back4app.com"
    }
    Parse.initialize(with: configuration)
    
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

