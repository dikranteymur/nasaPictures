//
//  CuriosityVC.swift
//  NasaPictures
//
//  Created by mdt on 1.12.2021.
//

import UIKit

class CuriosityVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var paginationView: UIView!
    @IBOutlet weak var paginationLabel: UILabel!
    
    private var filterNames: [String] = []
    private var currentIndex = 0
    var control = false
    var page = 1
    
    var viewModel: CuriosityViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    private var photos: [Photo] = []
    private var filteredPhotos: [Photo] = []
    var sheetController: UISheetPresentationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.load(page: 1)
        viewModel.setTitle()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
        initUI()
    }
    
    func initUI() {
        navigationController?.navigationBar.tintColor = .darkYellow
        
        paginationView.backgroundColor = .black.withAlphaComponent(0.3)
        paginationLabel.textColor = .darkYellow
        paginationLabel.font = .nasaMedium(size: 20)
        
    }
    
    @IBAction func filterButtonTapped(_ sender: Any) {
        viewModel.selectFilter(model: photos)
    }
    
}

extension CuriosityVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        if let imageUrl = filteredPhotos[indexPath.row].img_src {
            cell.setCell(image: imageUrl)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectPhoto(at: indexPath.row, list: filteredPhotos)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        currentIndex = indexPath.row
        paginationLabel.text = "\(indexPath.row)/\(filteredPhotos.count)"
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.contentOffset.y > scrollView.contentSize.height - scrollView.frame.size.height {
            page += 1
            viewModel.load(page: page)
        }
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
                control = isLoading
            case .showPhotos(let array):
                photos = array
                if filterNames.isEmpty {
                    filteredPhotos.removeAll()
                } else {
                    filteredPhotos = photos.filter({ filterNames.contains($0.camera?.name ?? "") })
                }
                collectionView.reloadData()
            case .showFilteredList(let filteredList):
                self.filterNames = filteredList
                filteredPhotos = photos.filter({ filteredList.contains($0.camera?.name ?? "") })
                collectionView.reloadData()
        }
    }
    
    func navigate(to route: CuriosityViewRoute) {
        switch route {
            case .detail(let detailPopupViewModel):
                let viewController = DetailPopupBuilder.make(with: detailPopupViewModel)
                viewController.modalTransitionStyle = .coverVertical
                present(viewController, animated: true, completion: nil)
            case .filter(let filterViewModel):
                let viewController = FilterBuilder.make(with: filterViewModel)
                present(viewController, animated: true, completion: nil)
        }
    }
    

}
