//
//  AppDelegate.swift
//  ColorCollectionDemo
//
//  Created by Oleg Chernyshenko on 28/01/18.
//  Copyright © 2018 Tugboat. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = makeRootViewController()
    window?.makeKeyAndVisible()
    return true
  }

  func makeRootViewController() -> UIViewController {
    let networkLayer = FirebaseLayer()
    let model = ColorModelRemote(with: networkLayer)
    let presenter = ColorCollectionPresenter(with: model)
    return ColorCollectionViewController(with: presenter)
  }
}
