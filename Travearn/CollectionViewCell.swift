//
//  CollectionViewCell.swift
//  Travearn
//
//  Created by Yoko Imajo on 6/18/16.
//  Copyright © 2016 YokoImajo. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet var descriptionlabel: UILabel!
    @IBOutlet var placelabel: UILabel!
    @IBOutlet var sizelabel: UILabel!
    @IBOutlet var pricelabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
