//
//  ViewController2.swift
//  TabView
//
//  Created by Nimesh Gurung on 22/12/2016.
//  Copyright © 2016 Nimesh Gurung. All rights reserved.
//

import UIKit
import React

class ViewController1: UIViewController {
    
    var view1: RCTRootView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view1 = ReactModule.sharedInstance.viewForModule(module: "App", initialProperties: ["route": "routeNameView1"])
        self.view.addSubview(view1)
        view1.frame = self.view.bounds
    }
}
