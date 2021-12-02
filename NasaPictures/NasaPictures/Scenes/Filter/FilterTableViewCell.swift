//
//  FilterTableViewCell.swift
//  NasaPictures
//
//  Created by mdt on 2.12.2021.
//

import UIKit

class FilterTableViewCell: UITableViewCell {

    @IBOutlet weak var selectUnselectImageView: UIImageView!
    @IBOutlet weak var cameraNameLabel: UILabel!
    
    var selectStatus: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        makeSelect()
    }
    
    func setCell(name: String) {
        cameraNameLabel.text = name

    }
    
    func makeSelect() {
        selectUnselectImageView.image = UIImage(named: "select")
    }
    
    func makeUnselect() {
        selectUnselectImageView.image = UIImage(named: "unselect")
    }

}
