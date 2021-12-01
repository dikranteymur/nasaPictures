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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.load()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
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
    
    
}

extension CuriosityVC: CuriosityViewModelDelegate {
    func handleOutput(_ output: CuriosityViewModelOutput) {
        switch output {
            case .updateTitle(let title):
                navigationItem.title = title
            case .setLoading(let bool):
                print("is loading: \(bool)")
            case .showPhotos(let array):
                photos = array
        }
    }
    
    func navigate(to route: CuriosityViewRoute) {
        
    }
    

}
