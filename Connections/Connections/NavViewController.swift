//
//  NavViewController.swift
//  Connections
//
//  Created by Felipe Ballesteros on 2018-01-15.
//  Copyright © 2018 FBApps. All rights reserved.
//

import UIKit

class NavViewController: UIViewController {
    @IBOutlet weak var MenuButton: UIBarButtonItem!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let rVc = self.revealViewController()
        rVc?.rearViewRevealWidth = 70
        MenuButton.target = rVc
        MenuButton.action = Selector("revealToggle:")
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
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
