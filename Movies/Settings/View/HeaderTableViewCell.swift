//
//  HeaderTableViewCell.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//


import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var settingsTitles: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
