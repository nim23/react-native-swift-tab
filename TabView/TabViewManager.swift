//
//  TabViewManager.swift
//  TabView
//
//  Created by Nimesh Gurung on 22/12/2016.
//  Copyright © 2016 Nimesh Gurung. All rights reserved.
//

import UIKit
import React

@objc(TabViewManager)
class TabViewManager: NSObject {
    var bridge: RCTBridge!
    
    @objc func showAlert(_ reactTag: NSNumber, _ viewName: NSString) {
        let alert = UIAlertController(title: "Native Alert \(viewName)", message: "Choose Yes or No", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default))
        
        DispatchQueue.main.async {
            if let view = self.bridge.uiManager.view(forReactTag: reactTag) {
                let currentViewController: UIViewController! = view.reactViewController()
                currentViewController.present(alert, animated: true, completion: nil)
            }
        }
    }
}
