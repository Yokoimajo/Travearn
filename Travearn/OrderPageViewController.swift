//
//  OrderPageViewController.swift
//  Travearn
//
//  Created by Yoko Imajo on 6/20/16.
//  Copyright © 2016 YokoImajo. All rights reserved.
//

import UIKit
import NCMB

class OrderPageViewController: UIViewController {
    
    @IBOutlet var setsumeitextfield: UITextField!
    @IBOutlet var placetextfield: UITextField!
    @IBOutlet var sizetextfield: UITextField!
    @IBOutlet var pricetextfield: UITextField!
    
    var setsumei: String = ""
    var place: String = ""
    var size: AnyObject = ""
    var price: AnyObject = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setsumei = "(例) ACT 参考書"
        self.place = "(例) Barnes and Nobles, USA"
        self.size = "(例) 40cm x 30cm"
        self.price = "(例) $30~40"
        
         // クラスのNCMBObjectを作成
        
        let obj:NCMBObject = NCMBObject(className: "merchandise")
       
  
        // オブジェクトに値を設定
    obj.setObject(self.sizetextfield.text!, forKey: "size")
    obj.setObject(self.placetextfield.text!, forKey: "place")
    obj.setObject(self.pricetextfield.text!, forKey: "price")
    obj.setObject(self.setsumeitextfield.text!, forKey: "setsumei")
    
    
    // データストアへの保存を実施
            
        obj.saveInBackgroundWithBlock { (error: NSError!) -> Void in
            
    if error != nil {
        
        // 保存に失敗した場合の処理
        
        let alert = UIAlertController.self(
            title: nil,
            message: "注文ができませんでした",
            preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: UIAlertActionStyle.Default,
                handler: nil
            )
        )
    
    }else{
        
        // 保存に成功した場合の処理
        
        let alert = UIAlertController.self(
            title: "注文完了",
            message: "注文ができました",
            preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: UIAlertActionStyle.Default,
                handler: nil
            )
        )

        
   
    }
        }
        }
        // Do any additional setup after loading the view.

    
    @IBAction func tapScreen(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
        
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
