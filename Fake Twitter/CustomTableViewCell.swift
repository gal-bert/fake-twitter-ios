//
//  CustomTableViewCell.swift
//  Fake Twitter
//
//  Created by Gregorius Albert on 10/05/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

	@IBOutlet weak var authorLabel: UILabel!
	@IBOutlet weak var contentLabel: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
