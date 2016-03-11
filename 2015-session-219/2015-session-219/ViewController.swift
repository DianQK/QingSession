//
//  ViewController.swift
//  2015-session-219
//
//  Created by 宋宋 on 16/3/11.
//  Copyright © 2016年 DianQK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let margins = view.layoutMarginsGuide
        
        let imageView = UIImageView(image: UIImage(named: "60 - iPhone"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.centerXAnchor
            .constraintEqualToAnchor(margins.centerXAnchor)
            .active = true
        imageView.centerYAnchor
            .constraintEqualToAnchor(margins.centerYAnchor)
            .active = true
        
        let label = UILabel()
        label.text = "SwiftGG"
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.centerXAnchor
            .constraintEqualToAnchor(margins.centerXAnchor)
            .active = true
        label.topAnchor
            .constraintEqualToAnchor(imageView.bottomAnchor, constant: 5)
            .active = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

