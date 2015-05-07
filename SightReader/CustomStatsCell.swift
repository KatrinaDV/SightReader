//
//  CustomStatsCell.swift
//  SightReader
//
//  Created by Katrina Voorhees on 4/30/15.
//  Copyright (c) 2015 Katrina Voorhees. All rights reserved.
//

import UIKit

class CustomStatsCell: UITableViewCell {
    
    @IBOutlet var infoButton: UIButton!
    
    @IBOutlet var barProgressView: UIProgressView!
    
    @IBOutlet var noteName: UILabel!
    
    @IBOutlet var notePercentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
