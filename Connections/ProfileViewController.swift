//
//  ProfileViewController.swift
//  Connections
//
//  Created by Felipe Ballesteros on 2018-01-10.
//  Copyright © 2018 FBApps. All rights reserved.
//

import UIKit
import FBSDKCoreKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var porfilePicture: FBSDKProfilePictureView!
    
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var ProfilePictureDispay: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let mask = UIImageView(image: UIImage(named: "CircleMask.png"))
       
        
        BackButton.addTarget(self.revealViewController(), action:#selector(SWRevealViewController.revealToggle(_:)),for:UIControlEvents.touchUpInside)
       
        
        
        loadUserImage(fromURL: "https://scontent.xx.fbcdn.net/v/t1.0-1/p100x100/10931543_10152742208246225_706482507095750357_n.jpg?oh=74feee94b548e016db653cde8b43dc6b&oe=5AB108E5")
        // Do any additional setup after loading the view.
        ProfilePictureDispay.mask = mask
        ProfilePictureDispay.mask?.layer.frame = ProfilePictureDispay.bounds
      
         self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        porfilePicture.profileID = "10155478932906225"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func loadUserImage(fromURL urlString:String?) {
        if urlString != nil {
            let imgURL: URL = URL(string: urlString!)!
            let request: URLRequest = URLRequest(url: imgURL)
            
            let session = URLSession.shared
            let task = session.dataTask(with: request, completionHandler: {
                (data, response, error) -> Void in
                
                if (error == nil && data != nil) {
                    func display_image() {
                        let userImage = UIImage(data: data!)
                        self.ProfilePictureDispay.image = userImage
                        
                    }
                    DispatchQueue.main.async(execute: display_image)
                }
            })
            task.resume()
        }
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
