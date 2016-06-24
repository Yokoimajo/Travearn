//
//  CollectionViewController.swift
//  Travearn
//
//  Created by Yoko Imajo on 6/20/16.
//  Copyright © 2016 YokoImajo. All rights reserved.
//

import UIKit
import NCMB



class CollectionViewController: UICollectionViewController {
    
    
     var merchandiseObjectId: String!
     var OrderArray: NSArray = NSArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.merchandiseObjectId = merchandiseData!.objectForKey("ObjectId") as String!

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        
        collectionView!.registerNib(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        
        
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
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

   override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    func loadOrderData(){
        let query: NCMBQuery = NCMBQuery(className: "merchandise")
        query.orderByAscending("createData")
        query.findObjectsInBackgroundWithBlock({(objects, error) in
            if error == nil{
                if self.OrderArray.count > 0{
                    self.collectionView!.reloadData()
                }
            }else{
                print(error.localizedDescription)
        }
    })
    }

   override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }

  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
    
    let obj = NCMBObject(className: "merchandise")
    
    cell.setsumeilabel.text = obj["setsumei"] as String?
    cell.placelabel.text = obj["place"] as String?
    cell.sizelabel.text = obj["size"] as String?
    cell.pricelabel.text = obj["price"] as String?
    
    return cell
}

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

    }
}


        // Configure the cell



    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */