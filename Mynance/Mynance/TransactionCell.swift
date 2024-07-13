//
//  TransactionCell.swift
//  Mynance
//
//  Created by Aadi Krishna on 5/3/24.
//

import UIKit

class TransactionCell: UITableViewCell {

    @IBOutlet var title: UILabel!
    @IBOutlet var iconImage: UIImageView!
    @IBOutlet var category: UILabel!
    @IBOutlet var costLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
