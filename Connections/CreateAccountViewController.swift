//
//  CreateAccountViewController.swift
//  Connections
//
//  Created by Felipe Ballesteros on 2018-01-09.
//  Copyright © 2018 FBApps. All rights reserved.
//

import UIKit
import Parse

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func BackButton(_ sender: Any) {
         (sender as AnyObject).setBackgroundImage(UIImage(named: "BlueBackIcon.png")!, for: .normal)
        
    }
    @IBAction func CreateAccountButton(_ sender: Any) {
        print(nameTextField.text!, emailTextField.text!, passwordTextField.text!)
        signUp(name: nameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!)
    }
    
    func signUp(name: String, email: String, password: String) {
        var user = PFUser()
        user.username = email
        user.password = password
        user.email = email
        // other fields can be set just like with PFObject
        user["name"] = name
        
        
        user.signUpInBackground (block: {
            (succeed, error) -> Void in
            if let error = error {
                print(error.localizedDescription)
                // Show the errorString somewhere and let the user try again.
            } else {
                print(succeed.description)
                print(succeed)
                print(succeed.hashValue)
            }
            })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        // Do any additional setup after loading the view.
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        switch (textField.tag){
        case 1:
             print(isValidEmail(email: textField.text!))
        case 2:
            print(isValidPassword(testStr: textField.text!))
        default:
            print("Do nothing")
        }
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
