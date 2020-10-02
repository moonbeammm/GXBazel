//
//  AppDelegate.swift
//  universal
//
//  Created by sgx on 2020/7/31.
//

import UIKit
import srcs_app_GXHome_home_library
//import srcs_common_GXCNavigationController_gxcnavigationcontroller_library
import TabBarController_library
import Navigationcontroller_library

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let homeVC = HomeViewController.init()
        
        let naviVC = NavigationController.init(rootViewController: homeVC)
        
        window?.rootViewController = naviVC

        window!.makeKeyAndVisible()

        return true
    }
}
