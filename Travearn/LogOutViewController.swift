//
//  LogOutViewController.swift
//  Travearn
//
//  Created by Yoko Imajo on 6/22/16.
//  Copyright © 2016 YokoImajo. All rights reserved.
//

import UIKit
import NCMB

class LogoutViewController: UIViewController {
    
    // Logoutボタン押下時の処理
    @IBAction func logoutBtn(sender: UIButton) {
        NCMBUser.logOut()
        self.dismissViewControllerAnimated(true, completion: nil)
        print("ログアウトしました")
        
    }
    
}

