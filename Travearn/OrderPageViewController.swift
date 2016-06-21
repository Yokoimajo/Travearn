//
//  OrderPageViewController.swift
//  Travearn
//
//  Created by Yoko Imajo on 6/20/16.
//  Copyright © 2016 YokoImajo. All rights reserved.
//

import UIKit

class OrderPageViewController: UIViewController {
    
    @IBOutlet var descriptiontextfield: UITextField!
    @IBOutlet var placetextfield: UITextField!
    @IBOutlet var sizetextfield: UITextField!
    @IBOutlet var pricetextfield: UITextField!
    
    var wordArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if saveData.arrayForKey("WORD") != nil {
            wordArray = saveData.arrayForKey("WORD")!
        }
    }

        @IBAction func saveOrderInfo(){
            let wordDictionary =
            ["description":descriptiontextfield.text, "place":placetextfield.text, "size":sizetextfield.text, "price":pricetextfield.text]
            
            wordArray.append("ここにタイプしてください")
            saveData.setObject(wordArray, forKey: "WORD")
            
            let alert = UIAlertController.self(
            title: "登録完了",
            message: "注文が完了しました",
            preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(
            UIAlertAction(
                title: "OK",
                style: UIAlertActionStyle.Default,
                handler: nil
            )
            )
            self.presentViewController(alert, animated: true, completion: nil)
            descriptiontextfield.text = ""
            placetextfield.text = ""
            sizetextfield.text = ""
            pricetextfield.text = ""
            
        }

        
        // Do any additional setup after loading the view.

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
