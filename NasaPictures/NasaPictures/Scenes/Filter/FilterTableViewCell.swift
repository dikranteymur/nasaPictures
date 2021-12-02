//
//  FilterTableViewCell.swift
//  NasaPictures
//
//  Created by mdt on 2.12.2021.
//

import UIKit

class FilterTableViewCell: UITableViewCell {

    @IBOutlet weak var selectUnselectButton: UIButton!
    @IBOutlet weak var cameraNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        selectUnselectButton.imageView?.image = UIImage(named: "unselect")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectUnselectButton.imageView?.image = UIImage(named: "select")
        
    }

}
