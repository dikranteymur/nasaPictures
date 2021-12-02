//
//  PopupViewController.swift
//  NasaPictures
//
//  Created by mdt on 1.12.2021.
//

import UIKit

class DetailPopupVC: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var earthDateLabel: UILabel!
    @IBOutlet weak var roverNameLabel: UILabel!
    @IBOutlet weak var cameraNameLabel: UILabel!
    @IBOutlet weak var roverStatusLabel: UILabel!
    @IBOutlet weak var launchDateLabel: UILabel!
    @IBOutlet weak var landingDateLabel: UILabel!
    
    var viewModel: DetailPopupViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        viewModel.load()
        initUI()
    }
    
    func initUI() {
        backgroundView.layer.cornerRadius = 12
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.darkYellow.cgColor
        
    }

}

extension DetailPopupVC: DetailPopupViewModelDelegate {
    func showDetailPopup(with detailModel: Photo) {
        imageView.sd_setImage(with: URL(string: detailModel.img_src ?? ""))
        earthDateLabel.text = detailModel.earth_date
        roverNameLabel.text = detailModel.rover?.name
        cameraNameLabel.text = detailModel.camera?.name
        roverStatusLabel.text = detailModel.rover?.status
        launchDateLabel.text = detailModel.rover?.launch_date
        landingDateLabel.text = detailModel.rover?.landing_date
        
    }
    
    
}
