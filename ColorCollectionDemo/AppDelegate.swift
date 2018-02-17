//
//  AppDelegate.swift
//  ColorCollectionDemo
//
//  Created by Oleg Chernyshenko on 28/01/18.
//  Copyright © 2018 Tugboat. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = makeRootViewController()
    window?.makeKeyAndVisible()
    return true
  }

  func makeRootViewController() -> UIViewController {
    let model = ColorModelLocal()
    let presenter = ColorCollectionPresenter(with: model)
    return ColorCollectionViewController(with: presenter)
  }
}
