//
//  AppDelegate.swift
//  CoreDataTasks
//
//  Created by Дмитрий on 12.10.2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        window?.rootViewController = UINavigationController(rootViewController: TaskListViewController()) // определяем стартовый вьюконтроллер
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {  //вызывается в случае фатальной шибки
        StorageManager.shared.saveContext()
    }

}

