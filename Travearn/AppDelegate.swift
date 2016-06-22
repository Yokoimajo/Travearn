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
        
    
    
        //NCMBUserのインスタンスを作成
        let user = NCMBUser()
        //ユーザー名を設定
        user.userName = "user1"
        //パスワードを設定
        user.password = "password1"
        //会員の登録を行う
        user.signUpInBackgroundWithBlock{(error: NSError!) in
            if error != nil {
                // 新規登録失敗時の処理
                
            }else{
                // 新規登録成功時の処理
            }
        }
        
        // ユーザー名とパスワードでログイン
        NCMBUser.logInWithUsernameInBackground("user1", password: "password1", block:{(user: NCMBUser!, error: NSError!) in
            if error != nil {
                // ログイン失敗時の処理
                
            }else{
                // ログイン成功時の処理
                
            }
        })
        
        // ログアウト
        NCMBUser.logOut()
        
        // ログイン中のユーザーの取得
        let carrentUser = NCMBUser.currentUser()
        
        var error : NSError? = nil
        NCMBUser.requestAuthenticationMail("yokoimajo@gmail.com", error: &error)
        
        // メールアドレスとパスワードでログイン
        NCMBUser.logInWithMailAddressInBackground("test@sample.com", password: "password2", block:{(user: NCMBUser!, error: NSError!) in
            if error != nil {
                // ログイン失敗時の処理
                
            }else{
                // ログイン成功時の処理
                
            }
        })
        // 匿名ユーザーでログイン
        NCMBAnonymousUtils.logInWithBlock{(user: NCMBUser!, error: NSError!) in
            if error != nil {
                // ログイン失敗時の処理
                
            }else{
                // ログイン成功時の処理
                
            }
        }
        if NCMBAnonymousUtils.isLinkedWithUser(NCMBUser.currentUser()) {
            // 匿名ユーザーでログインしている時の処理
            
        }else{
            // 匿名ユーザーでログインしていない時の処理
            
        }
        
        // ロールの作成
        let freePlanRole = NCMBRole(name: "freePlan")
        freePlanRole.saveInBackgroundWithBlock(nil)
        let proPlanRole = NCMBRole(name: "proPlan")
        proPlanRole.saveInBackgroundWithBlock(nil)
        
        // ユーザーを作成
        user.userName = "expertUser"
        user.password = "pass"
        user.signUp(nil)
        
        // 登録済みユーザーをロールに追加
        let role = NCMBRole(name: "expertPlan")
        role.addUser(user)
        role.save(nil)
        
        // ロールに追加するユーザーを作成
        user.userName = "expartUser"
        user.password = "password"
        user.signUpInBackgroundWithBlock{(error: NSError!) in
            if error != nil {
                // ユーザー作成失敗時の処理
                
            }else{
                // ユーザー作成成功時の処理
                // 既存ロールの"expartPlan"を検索
                let query = NCMBRole.query()
                query.whereKey("roleName", equalTo: "expartPlan")
                query.findObjectsInBackgroundWithBlock {(objects: [AnyObject]!, error: NSError!) -> Void in
                    if error != nil {
                        // 検索失敗時の処理
                        
                    }else{
                        // 検索成功時の処理
                        // 検索結果をロールに設定してユーザーを追加
                        let role = objects.first
                        role!.addUser(user)
                        role!.saveInBackgroundWithBlock{(error: NSError!) -> Void in
                            if error != nil {
                                // ユーザー追加失敗時の処理
                                
                            }else{
                                // ユーザー追加成功時の処理
                            }
                        }
                    }
                }
            }
        }
        
        // 子ロール
        let administrators = NCMBRole(name: "Administrators")
        administrators.save(nil)
        let moderators = NCMBRole(name: "Monderators")
        moderators.addRole(administrators)
        moderators.save(nil)
        
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
                    if(saveError == nil) {
                        print("[SAVE] Done.")
                    } else {
                        print("[SAVE ERROR] \(saveError)")
                    }
                }
            } else {
                print(error.localizedDescription)
            }
        }
        return true


class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

        
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




