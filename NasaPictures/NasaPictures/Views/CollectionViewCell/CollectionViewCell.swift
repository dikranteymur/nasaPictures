//
//  CollectionViewCell.swift
//  NasaPictures
//
//  Created by mdt on 1.12.2021.
//

import UIKit
import SDWebImage

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        iniUI()
    }
    
    func iniUI() {
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.borderWidth = 1
    }
    
    func setCell(image: String) {
        imageView.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "placeholder"))
    }
    
}
