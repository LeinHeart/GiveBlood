//
//  ViewCellMap.swift
//  GiveBloodApp
//
//  Created by Terretino on 06/06/18.
//  Copyright © 2018 Kristopher Chayadi. All rights reserved.
//

import UIKit

class ViewCellMap: UITableViewCell {

    
    
    @IBOutlet weak var gambarEvent: UIImageView!
    @IBOutlet weak var namaEvent: UILabel!
    @IBOutlet weak var alamatEvent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
