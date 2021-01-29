//
//  TableViewCell.swift
//  Adyptaion - Pain tracker
//
//  Created by Darren Jr Baldwin  on 8/24/20.
//  Copyright © 2020 Darren Baldwin Jr. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var PainLabelCell: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
