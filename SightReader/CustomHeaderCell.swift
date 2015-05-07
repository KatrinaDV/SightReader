//
//  CustomHeaderCell.swift
//  SightReader
//
//  Created by Katrina Voorhees on 4/30/15.
//  Copyright (c) 2015 Katrina Voorhees. All rights reserved.
//

import UIKit

class CustomHeaderCell: UITableViewCell {
    
    @IBOutlet var clefIcon: UIImageView!
    
    @IBOutlet var clefLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
