//
//  kkTableViewCell.swift
//  LearKKBOX
//
//  Created by Neal on 2020/1/17.
//  Copyright © 2020 neal812220. All rights reserved.
//

import UIKit

class KKTableViewCell: UITableViewCell {

    @IBOutlet weak var kkImage: UIImageView!
    
    @IBOutlet weak var nemeLabel: UILabel!
    
    @IBOutlet weak var heartButton: UIButton!
    
    @IBAction func tapHeartButton(_ sender: UIButton) {
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
