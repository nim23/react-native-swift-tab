//
//  ReactViewInstantiate.swift
//  TabView
//
//  Created by Nimesh Gurung on 22/12/2016.
//  Copyright © 2016 Nimesh Gurung. All rights reserved.
//

import Foundation
import UIKit
import React

protocol ReactViewInstantiate: class {
    var reactView: RCTRootView! { get set }
}

extension ReactViewInstantiate where Self:UIViewController {
    func instantiateReactView(view: String, props: [String:Any]?) {
        reactView = ReactModule.sharedInstance.viewForModule(module: "App", initialProperties: props)
        self.view.addSubview(reactView)
        reactView.frame = self.view.bounds
    }
}
