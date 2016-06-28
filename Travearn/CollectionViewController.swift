//
//  CollectionViewController.swift
//  Travearn
//
//  Created by Yoko Imajo on 6/20/16.
//  Copyright © 2016 YokoImajo. All rights reserved.
//

import UIKit
import NCMB

class CollectionViewController: UICollectionViewController, UIViewControllerTransitioningDelegate {
    
     var merchandiseObjectId: String!
     var OrderArray: NSArray = NSArray()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.merchandiseObjectId = merchandiseData!.objectForKey("ObjectId") as String!
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

    // セルの登録
    collectionView!.registerNib(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier:"cell")
        
    self.loadOrderData()
    }

        // Do any additional setup after loading the view.

   override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }

    // MARK: UICollectionViewDataSource

   override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    
    //取得データの数
    if self.OrderArray.count > 0 {
        return self.OrderArray.count
    } else {
        return 0
    }
    }

     //nifty cloudからの読み込み
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

    
    // Configure the cell
    
    cell.setsumeilabel.text = obj.objectForKey("setsumei") as! String?
    cell.placelabel.text = obj.objectForKey("place") as! String?
    cell.sizelabel.text = obj.objectForKey("size") as! String?
    cell.pricelabel.text = obj.objectForKey("price") as! String?
    
    return cell

    }

}










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

//注文画面へ移動/
/*
//
@IBOutlet var transitionButton: UIButton!

let transition = BubbleTransition()
var startingPoint = CGPointZero
var duration = 0.5
var transitionMode: BubbleTransitionMode = .Present
var bubbleColor: UIColor = .whiteColor()


override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
let controller = segue.destinationViewController
controller.transitioningDelegate = self
controller.modalPresentationStyle = .Custom
}

func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
transition.transitionMode = .Present
transition.startingPoint = transitionButton.center
transition.bubbleColor = transitionButton.backgroundColor!
return transition
}

func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
transition.transitionMode = .Dismiss
transition.startingPoint = transitionButton.center
transition.bubbleColor = transitionButton.backgroundColor!
return transition
}

//各値をセルに入れる
let OrderInfo: AnyObject = self.OrderArray[indexPath.row]
print(OrderInfo)
cell.setsumeilabel.text = OrderInfo.objectForKey("setsumei") as? String
cell.placelabel.text = OrderInfo.objectForKey("place") as? String
cell.sizelabel.text = OrderInfo.objectForKey("size") as? String
cell.pricelabel.text = OrderInfo.objectForKey("price") as? String
*/
