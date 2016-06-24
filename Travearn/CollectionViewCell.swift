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
    

    
    @IBOutlet var descriptionlabel: UILabel!
    @IBOutlet var placelabel: UILabel!
    @IBOutlet var sizelabel: UILabel!
    @IBOutlet var pricelabel: UILabel!
        // 取得に成功した場合の処理
    
    // (例)取得したデータの出力
    
    //label.text = String(descriptionlabel)
 

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
