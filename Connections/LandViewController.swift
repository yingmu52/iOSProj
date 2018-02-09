//
//  LandViewController.swift
//  Connections
//
//  Created by Felipe Ballesteros on 2018-01-09.
//  Copyright © 2018 FBApps. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

class LandViewController: UIViewController {

  
    @IBAction func Facebook(_ sender: Any) {
        print("Facebook pressed")
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [.publicProfile], viewController: self){
            LoginResult in self.loginManagerDidComplete(result: LoginResult)
            self.getUserPRofile()
        }
        print("Loggingout")
      
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginManagerDidComplete(result: LoginResult){
        switch result {
        case .cancelled:
            print("Cancelled")
        case .failed(let error):
            print("Failed"+error.localizedDescription)
        case .success(let grantedPermissions,let declinedPermissions,let token):
            print("hola");
            
        }
        
    }

  
    
    func getUserPRofile(){
        let connection = GraphRequestConnection()
        let deviceScale = Int(UIScreen.main.scale)
        let width = 100 
        let height = 100
        let parameters = ["fields": "first_name, last_name,email,gender,age_range,birthday,picture.width(\(width)).height(\(height))"]
        connection.add(GraphRequest(graphPath: "/me", parameters: parameters)) { httpResponse, result in
            switch result {
            case .success(let response):
                print("Graph Request Succeeded: \(response)")
                print(response.arrayValue)
                print(response.dictionaryValue)
                print(response.stringValue)
            case .failed(let error):
                print("Graph Request Failed: \(error)")
            }
        }
        connection.start()
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
