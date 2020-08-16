//
//  AppDelegate.swift
//  Clickuneune
//
//  Created by Олег Романов on 01.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    static var shared: AppDelegate?

    lazy var window: UIWindow? = UIWindow()

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // UserDefaults.standard.removeObject(forKey: "score")
        // UserDefaults.standard.removeObject(forKey: "offset")

        window?.rootViewController = MainScreenController()
        // window?.rootViewController = NumbersController()
        window?.makeKeyAndVisible()
        AppDelegate.shared = self

        return true
    }
}
