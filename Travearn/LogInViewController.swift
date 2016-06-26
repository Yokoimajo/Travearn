//
//  LogInViewController.swift
//  Travearn
//
//  Created by Yoko Imajo on 6/22/16.
//  Copyright © 2016 YokoImajo. All rights reserved.
//

import UIKit
import NCMB
import BubbleTransition

class LogInViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    //SignUp画面へ移動//
    @IBOutlet var transitionButton: UIButton!
    
    let transition = BubbleTransition()
    var startingPoint = CGPointZero
    var duration = 0.5
    var transitionMode: BubbleTransitionMode = .Present
    var bubbleColor: UIColor = .yellowColor()
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let controller = segue.destinationViewController
    controller.transitioningDelegate = self
    controller.modalPresentationStyle = .Popover
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    transition.transitionMode = .Present
    transition.startingPoint = transitionButton.center
//    transition.bubbleColor = transitionButton.backgroundColor!
    return transition
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    transition.transitionMode = .Dismiss
    transition.startingPoint = transitionButton.center
    transition.bubbleColor = transitionButton.backgroundColor!
    return transition
    }
    

    // User Name
    @IBOutlet weak var userNameTextField: UITextField!
    // Password
    @IBOutlet weak var passwordTextField: UITextField!
    
    // 画面表示時に実行される
    override func viewDidLoad() {
        super.viewDidLoad()
        // Passwordをセキュリティ入力に設定する
        self.passwordTextField.secureTextEntry = true
        
    }
    
    // キーボードを閉じる
    func closeKeyboad(){
        userNameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Loginボタン押下時の処理
    @IBAction func loginBtn(sender: UIButton) {
        
    // ユーザー名とパスワードでログイン
    NCMBUser.logInWithUsernameInBackground(self.userNameTextField.text, password: self.passwordTextField.text, block:{(user: NCMBUser?, error: NSError!) in
            
        if error != nil{
            print("Login Failed\(error)")
            let error = UIAlertController(
                title: "Login Failed",
                message: "ユーザー名かパスワードが間違っています。",
                preferredStyle: UIAlertControllerStyle.Alert
            )
            error.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.Default,
                    handler: self.reset
                )
            )
            self.presentViewController(error, animated: true, completion: nil)
                
                
        }else{
            print("Login Successful!")
            let login = UIAlertController(
                title: "Login Successful",
                message: "ログインしました!",
                preferredStyle: UIAlertControllerStyle.Alert
            )
            login.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.Default,
                    handler: self.goToMainMenu
                ))
            self.presentViewController(login, animated: true, completion: nil)
        }
        })
    
    }
    
    func goToMainMenu(ac: UIAlertAction){
        let startView = self.storyboard!.instantiateViewControllerWithIdentifier("Main") as? UICollectionViewController
        startView?.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.presentViewController(startView!, animated: true, completion: nil)
        cleanTextField()
    }
    
    func reset(ac: UIAlertAction){
        self.userNameTextField.text = ""
        self.passwordTextField.text = ""
    }

    
    func back(segue: UIStoryboardSegue){
        
    }

    
    // 背景タップするとキーボードを隠す
    @IBAction func tapScreen(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
        
    }
    
    // TextFieldを空にする
    func cleanTextField(){
        userNameTextField.text = ""
        passwordTextField.text = ""
        
    }
    
    
    let carrentUser = NCMBUser.currentUser()
    
    
    }


/*
// errorLabel
@IBOutlet weak var errorLabel: UILabel!
// SignUp画面へ遷移
func toSignUp(sender: UIButton) {
// TextFieldを空にする
cleanTextField()
// errorLabelを空に
cleanErrorLabel()
// キーボードを閉じる
closeKeyboad()


}
// 入力確認
if self.userNameTextField.text!.isEmpty || self.passwordTextField.text!.isEmpty {
self.errorLabel.text = "未入力の項目があります"

// TextFieldを空に
self.cleanTextField()

return

}

// errorLabelを空にする
func cleanErrorLabel(){
errorLabel.text = ""

}
// TextFieldを空に
self.cleanTextField()

if error != nil {
// ログイン失敗時の処理
self.errorLabel.text = "ログインに失敗しました:\(error.code)"
print("ログインに失敗しました:\(error.code)")

}else{
// ログイン成功時の処理
self.performSegueWithIdentifier("login", sender: self)
print("ログインに成功しました:\(user?.objectId)")
*/