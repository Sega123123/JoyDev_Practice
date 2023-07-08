//
//  NavigationTabBar.swift
//  JoyDev_Practice
//
//  Created by  ProveY0urW0rth on 08.07.2023.
//

import UIKit
import SwiftUI

final class NavigationTabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isTranslucent = true
        tabBar.tintColor = .black
        if #available(iOS 14.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            tabBar.standardAppearance = appearance
        }
        setupVCs()
    }
    
    private func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
    
    func setupVCs(){
        viewControllers = [
            createNavController(for: ViewController(), title: "Carusel", image: UIImage(systemName: "house")!),
            createNavController(for: UIHostingController(rootView: ProfileView()), title: "Profile", image: UIImage(systemName: "person")!)
        ]
    }
    
}
