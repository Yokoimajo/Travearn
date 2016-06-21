//
//  InitialScreenViewController.swift
//  Travearn
//
//  Created by Yoko Imajo on 6/21/16.
//  Copyright © 2016 YokoImajo. All rights reserved.
//

import UIKit

class InitialScreenViewController: UIViewController {
    
    @IBAction func back(segue: UIStoryboardSegue){
        
    }
    
    @IBAction func startButtonTapped(){
        let saveData = NSUserDefaults.standardUserDefaults()
        
        if let wordArray = saveData.arrayForKey("WORD"){
            if wordArray.count > 0 {
                self.performSegueWithIdentifier("toOrderPageViewController", sender: nil)
                return
                
            }
    }
        
        let alert: UIAlertController = UIAlertController(
            title : "単語",
            message: "まずは注文してください",
            preferredStyle: .Alert
            
        )
        
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .Default,
            handler: nil
            )
            
            )
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
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
