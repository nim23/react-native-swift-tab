//
//  ViewController2.swift
//  TabView
//
//  Created by Nimesh Gurung on 22/12/2016.
//  Copyright © 2016 Nimesh Gurung. All rights reserved.
//

import UIKit
import React

class ViewController2: UIViewController, ReactViewInstantiate {

    var reactView: RCTRootView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
		self.instantiateReactView(view: "view2", props: ["route": "routeNameView2"])
	}
}
