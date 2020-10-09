//
//  AppDelegate.swift
//  ShoppingList
//
//  Created by Eric Alves Brito.
//  Copyright © 2020 FIAP. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        if Auth.auth().currentUser != nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let listTableViewController = storyboard.instantiateViewController(withIdentifier: String(describing: ListTableViewController.self))
            let nc = window?.rootViewController as? UINavigationController
            nc?.viewControllers = [listTableViewController]
        }
        
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        RemoteConfigValues.shared.fetch()
    }
}

