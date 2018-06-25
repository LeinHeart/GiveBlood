//
//  CustomTableViewCell.swift
//  GiveBloodApp
//
//  Created by Kristopher Chayadi on 05/06/18.
//  Copyright © 2018 Kristopher Chayadi. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var gambarView: UIImageView!
    @IBOutlet weak var lokasiLbl: UILabel!
    @IBOutlet weak var alamatLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
