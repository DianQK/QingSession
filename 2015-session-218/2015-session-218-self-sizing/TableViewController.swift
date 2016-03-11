//
//  ViewController.swift
//  2015-session-218-self-sizing
//
//  Created by 宋宋 on 16/3/11.
//  Copyright © 2016年 DianQK. All rights reserved.
//

import UIKit

typealias CellModel = (imageName: String, content: String)

class TableViewController: UITableViewController {
    
    let swiftGG = [CellModel(imageName: "meizi", content: "SwiftGG SwiftGG"),
        CellModel(imageName: "meizi", content: "SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG"),
        CellModel(imageName: "meizi", content: "SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG"),
        CellModel(imageName: "meizi", content: "SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG"),
        CellModel(imageName: "meizi", content: "SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG"),
        CellModel(imageName: "meizi", content: "SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG"),
        CellModel(imageName: "meizi", content: "SwiftGG SwiftGG SwiftGG SwiftGG SwiftGG")
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.estimatedRowHeight = 158.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return swiftGG.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! GGTableViewCell
        
        cell.contentImageView.image = UIImage(named: swiftGG[indexPath.row].imageName)
        cell.contentLabel.text = swiftGG[indexPath.row].content
        
        return cell
    }
    
}

