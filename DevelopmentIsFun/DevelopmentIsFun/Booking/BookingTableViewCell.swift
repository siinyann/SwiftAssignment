//
//  BookingTableViewCell.swift
//  DevelopmentIsFun
//
//  Created by Swift on 8/4/22.
//

import UIKit

class BookingTableViewCell: UITableViewCell {

    // All IB outlets for this view controller
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
