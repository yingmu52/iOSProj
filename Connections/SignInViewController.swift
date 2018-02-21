//
//  SignInViewController.swift
//  Connections
//
//  Created by Felipe Ballesteros on 2018-01-09.
//  Copyright © 2018 FBApps. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var UsernameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let paddingView = UITextView(frame: CGRect(x:0, y:-100, width:150, height: 0))
        paddingView.text = "chao"
        UsernameField.leftView = paddingView
        UsernameField.leftViewMode = .always
       
       
        print(UsernameField.textRect)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
