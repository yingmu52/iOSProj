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
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var ProfilePictureDispay: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guard let firstName = UserDefaults.standard.string(forKey: "FirstName") as String? else {
            return
        }
        
        guard let lastName = UserDefaults.standard.string(forKey: "LastName") as String? else{
            return
        }
        NameLabel.text = "\(firstName) \(lastName)"
        let mask = UIImageView(image: UIImage(named: "Mask.png"))
       
        
        BackButton.addTarget(self.revealViewController(), action:#selector(SWRevealViewController.revealToggle(_:)),for:UIControlEvents.touchUpInside)
       
        guard let imageURL = UserDefaults.standard.string(forKey: "ProfilePictureURL") as String? else{
            //TODO load default NOImage Image
            return
        }
        
        
        print(imageURL)
        loadUserImage(fromURL: imageURL)
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
    
    func displayUserInfo(){
        
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
