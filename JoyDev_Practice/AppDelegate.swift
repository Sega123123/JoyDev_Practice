//
//  AppDelegate.swift
//  JoyDev_Practice
//
//  Created by Сергей on 05.07.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let frameVC = NavigationTabBar()
        let navigationVC = UINavigationController.init(rootViewController: frameVC)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
        return true
    }
}


