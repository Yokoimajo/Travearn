//
//  LogInViewController.swift
//  Travearn
//
//  Created by Yoko Imajo on 6/22/16.
//  Copyright © 2016 YokoImajo. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
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
    if error != nil　{
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
    let user = NCMBUser()
    user.userName = "expertUser"
    user.password = "pass"
    user.signUp(nil)
    
    // 登録済みユーザーをロールに追加
    let role = NCMBRole(name: "expertPlan")
    role.addUser(user)
    role.save(nil)

    // ロールに追加するユーザーを作成
    let user = NCMBUser()
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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
