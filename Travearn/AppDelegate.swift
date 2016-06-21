//
//  AppDelegate.swift
//  Travearn
//
//  Created by Yoko Imajo on 6/11/16.
//  Copyright © 2016 YokoImajo. All rights reserved.
//

import UIKit
import NCMB

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    //********** APIキーの設定 **********
    let applicationkey = "63a1892a22bcb014ff3cb3f79b8f5523f38a643b4b754438497ffb0ec0a0d844"
    let clientkey      = "9fba51c047bff92b69a41b483f2d8fb1bfe4859e697769d8004eb78c73d40667"
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        //********** SDKの初期化 **********
        NCMB.setApplicationKey(applicationkey, clientKey: clientkey)
        //▼▼▼起動時に処理される▼▼▼
        
        //▲▲▲起動時に処理される▲▲▲
        return true
    }
}

//********** データストアにデータを保存 **********
let query = NCMBQuery(className: "TestClass")
query.whereKey("message", equalTo: "Hello, NCMB!")
query.findObjectsInBackgroundWithBlock{(NSArray objects, NSError error) in
    if error == nil {
        if objects.count > 0 {
            let message = objects[0].objectForKey("message") as! NSString
            print("[FIND] \(message)")
        } else {
            var saveError: NSError?
            let obj = NCMBObject(className: "TestClass")
            obj.setObject("Hello, NCMB!", forKey: "message")
            obj.save(&saveError)
            if saveError == nil {
                print("[SAVE] Done.")
            } else {
                print("[SAVE ERROR] \(saveError)")
            }
        }
    } else {
        print(error.localizedDescription)
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

