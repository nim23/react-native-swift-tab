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
class TabViewManager: RCTEventEmitter {
    
    override func supportedEvents() -> [String]! {
        return ["TabViewManagerEvent"]
    }
    
    @objc func showAlert(_ reactTag: NSNumber, _ viewName: NSString) {
        let alert = UIAlertController(title: "Native Alert \(viewName)", message: "Choose Yes or No", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: {
            [unowned self] action in
                self.sendEvent(withName: "TabViewManagerEvent", body: ["message":"Yes", "reactTag": reactTag])
        }))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: {
            [unowned self] action in
                self.sendEvent(withName: "TabViewManagerEvent", body: ["message":"No", "reactTag": reactTag])
        }))
        
        DispatchQueue.main.async {
            if let view = self.bridge.uiManager.view(forReactTag: reactTag) {
                let currentViewController: UIViewController! = view.reactViewController()
                currentViewController.present(alert, animated: true, completion: nil)
            }
        }
    }
}
