//
//  ViewController2.swift
//  TabView
//
//  Created by Nimesh Gurung on 22/12/2016.
//  Copyright © 2016 Nimesh Gurung. All rights reserved.
//

import UIKit
import React

class ViewController2: UIViewController {

    var view2: RCTRootView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view2 = ReactModule.sharedInstance.viewForModule(module: "App", initialProperties: ["route": "routeNameView2"])
        self.view.addSubview(view2)
        view2.frame = self.view.bounds
    }
}
