//
//  UIImageViewWithMask.swift
//  Connections
//
//  Created by Felipe Ballesteros on 2018-01-10.
//  Copyright © 2018 FBApps. All rights reserved.
//

import UIKit
@IBDesignable
class UIImageViewWithMask: UIImageView {
    var maskImageView = UIImageView()
    
    @IBInspectable
    var maskImage: UIImage?{
    didSet{
        maskImageView.image = maskImage
    }
}
}
