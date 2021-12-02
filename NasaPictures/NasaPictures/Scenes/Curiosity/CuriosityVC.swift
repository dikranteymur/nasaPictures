//
//  CuriosityVC.swift
//  NasaPictures
//
//  Created by mdt on 1.12.2021.
//

import UIKit

class CuriosityVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: CuriosityViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    private var photos: [Photo] = []
    var sheetController: UISheetPresentationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.load()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        navigationController?.navigationBar.tintColor = .darkYellow
    }
    
    @IBAction func filterButtonTapped(_ sender: Any) {

    }
    
}

extension CuriosityVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        if let imageUrl = photos[indexPath.row].img_src {
            cell.setCell(image: imageUrl)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectPhoto(at: indexPath.row)
    }
}

extension CuriosityVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Double(collectionView.frame.width - 25) / 2
        return CGSize(width: width, height: width)
        
    }
}

extension CuriosityVC: CuriosityViewModelDelegate {
    func handleOutput(_ output: CuriosityViewModelOutput) {
        switch output {
            case .updateTitle(let title):
                navigationItem.title = title
            case .setLoading(let isLoading):
                LoadingView.shared.startLoading(viewController: self, isLoading: isLoading)
            case .showPhotos(let array):
                photos = array
                collectionView.reloadData()
            case .showFilteredPhotos(let filteredArray):
                print(filteredArray)
        }
    }
    
    func navigate(to route: CuriosityViewRoute) {
        switch route {
            case .detail(let detailPopupViewModel):
                let viewController = DetailPopupBuilder.make(with: detailPopupViewModel)
                viewController.modalTransitionStyle = .coverVertical
                present(viewController, animated: true, completion: nil)
            case .filter:
//                let filterVC = FilterBuilder.make()
//                present(filterVC, animated: true, completion: nil)
                print("filter")
        }
    }
    

}
