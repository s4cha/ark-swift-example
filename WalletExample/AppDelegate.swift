//
//  AppDelegate.swift
//  WalletExample
//
//  Created by Sacha DSO on 10/12/2017.
//  Copyright © 2017 freshos. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Account
        let accountVC = storyboard.instantiateViewController(withIdentifier: "Account")
        let accountNavVC = UINavigationController(rootViewController: accountVC)
        
        // Transactions
        let transactionsVC = TransactionsVC()
        let transactionsNavVC = UINavigationController(rootViewController: transactionsVC)
        
        // Info
        let infoVC = InfoVC()
        let infoNavVC = UINavigationController(rootViewController: infoVC)
        
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = [accountNavVC, transactionsNavVC, infoNavVC]
        
        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
        return true
    }
}

