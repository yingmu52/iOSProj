//
//  CreateAccountViewController.swift
//  Connections
//
//  Created by Felipe Ballesteros on 2018-01-09.
//  Copyright © 2018 FBApps. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBAction func BackButton(_ sender: Any) {
         (sender as AnyObject).setBackgroundImage(UIImage(named: "BlueBackIcon.png")!, for: .normal)
    }
    @IBAction func CreateAccountButton(_ sender: Any) {
           }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
