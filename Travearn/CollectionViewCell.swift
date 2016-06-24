//
//  CollectionViewCell.swift
//  Travearn
//
//  Created by Yoko Imajo on 6/18/16.
//  Copyright © 2016 YokoImajo. All rights reserved.
//

import UIKit
import NCMB

class CollectionViewCell: UICollectionViewCell {
    
    // クラスのNCMBObjectを作成
    let obj3 = NCMBObject(className: "TestClass")
    
    @IBOutlet var descriptionlabel: UILabel!
    @IBOutlet var placelabel: UILabel!
    @IBOutlet var sizelabel: UILabel!
    @IBOutlet var pricelabel: UILabel!
    
    
    // objectIdプロパティを設定
    obj3.objectId = "***検索するデータのobjectId***"
    // 設定されたobjectIdを元にデータストアからデータを取得
    obj3.fetchInBackgroundWithBlock { (error: NSError!) -> Void in
    if error != nil {
    // 取得に失敗した場合の処理
    }else{
    print(obj3)
    }
    }
    
    // 取得に成功した場合の処理
    
    // (例)取得したデータの出力
    
    //label.text = String(descriptionlabel)
 
    

    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
