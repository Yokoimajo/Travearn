//
//  SignUpViewController.swift
//  Travearn
//
//  Created by Yoko Imajo on 6/22/16.
//  Copyright © 2016 YokoImajo. All rights reserved.
//

import UIKit
import NCMB

class SignUpViewController: UIViewController{
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password1: UITextField!
    @IBOutlet weak var password2: UITextField!
    
    var user: NCMBUser = NCMBUser()
    
    
    // 画面表示時に実行される
    override func viewDidLoad() {
        super.viewDidLoad()
        //Place Holders
        userName.placeholder = "User Name"
        password1.placeholder = "password"
        password2.placeholder = "password"
        
        // Passwordをセキュリティ入力に設定
        self.password1.secureTextEntry = true
        self.password2.secureTextEntry = true
        
    }
    
    // SignUpボタン押下時の距離
    @IBAction func signUpBtn(sender: UIButton) {

        //パスワードが一致の時
        if password1.text == password2.text {
            user.userName = userName.text
            user.password = password1.text
            user.signUpInBackgroundWithBlock({(error: NSError?) in
                if error != nil{
                    print("登録に失敗\(error)")
                    //未記入の項目がある時
                    if ( (self.userName.text?.isEmpty)! || (self.password1.text?.isEmpty)! || (self.password2.text?.isEmpty)!){
                        let error = UIAlertController(
                            title: "未記入の項目があります",
                            message: "入力し直してください",
                            preferredStyle: UIAlertControllerStyle.Alert
                        )
                        error.addAction(
                            UIAlertAction(
                                title: "OK",
                                style: UIAlertActionStyle.Default,
                                handler: nil
                            )
                        )
                        self.presentViewController(error, animated: true, completion: nil)
                    }
                }else {
                    print("登録成功")
                    
                    let signUp = UIAlertController(
                        title: "登録完了",
                        message: "アカウントの登録が完了しました",
                        preferredStyle: UIAlertControllerStyle.Alert
                    )
                    signUp.addAction(
                        UIAlertAction(
                            title: "OK",
                            style: UIAlertActionStyle.Default,
                            handler:  self.goMainMenu
                        )
                    )
                    self.presentViewController(signUp, animated: true, completion: nil)
                }
                })
            //パスワードが一致しない時
        }else if (self.password1.text != self.password2.text){
            print("hoge")
            let errorAlert = UIAlertController(
                title: "パスワードが一致しません",
                message: "入力し直してください",
                preferredStyle: UIAlertControllerStyle.Alert
            )
            errorAlert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.Default,
                    handler: nil
                )
            )
            self.presentViewController(errorAlert, animated: true, completion: nil)
            cleanTextField()
        }
        
    }
    
    
    func goMainMenu(ac: UIAlertAction){
        let startView = self.storyboard!.instantiateViewControllerWithIdentifier("Main") as! UICollectionViewController
        startView.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.presentViewController(startView, animated: true, completion: nil)
    }
    
    // 背景タップするとキーボードを隠す
    @IBAction func tapScreen(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
        
    }

    
    func cleanTextField(){
        userName.text = ""
        password1.text = ""
        password2.text = ""
}
    
    @IBAction func back() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}

/*// 入力確認
if self.userNameTextField.text!.isEmpty || self.passwordTextField.text!.isEmpty || self.passwordTextField_second.text!.isEmpty {
self.errorLabel.text = "未入力の項目があります"
// TextFieldを空に
self.cleanTextField()

return

} else if passwordTextField.text! != passwordTextField_second.text! {
self.errorLabel.text = "Passwordが一致しません"
// TextFieldを空に
self.cleanTextField()

return


}

//NCMBUserのインスタンスを作成
let user = NCMBUser()
//ユーザー名を設定
user.userName = self.userNameTextField.text
//パスワードを設定
user.password = self.passwordTextField.text

//会員の登録を行う
user.signUpInBackgroundWithBlock{(error: NSError!) in
// TextFieldを空に
self.cleanTextField()

if error != nil {
// 新規登録失敗時の処理
self.errorLabel.text = "ログインに失敗しました:\(error.code)"
print("ログインに失敗しました:\(error.code)")

} else {
// 新規登録成功時の処理
print("ログインに成功しました:\(user.objectId)")

}

}

}
*/

/*/ キーボードを閉じる
func closeKeyboad(){
userNameTextField.resignFirstResponder()
passwordTextField.resignFirstResponder()
passwordTextField_second.resignFirstResponder()

}
// errorLabelを空にする
func cleanErrorLabel(){
errorLabel.text = ""

}


*/
    