//
//  FilterViewController.swift
//  NasaPictures
//
//  Created by mdt on 2.12.2021.
//

import UIKit

class FilterVC: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var unselectAllButton: UIButton!
    
    let cameras: [CamerasName] = []
    
    var viewModel: FilterViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        viewModel.delegate = self
        viewModel.load()
        
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectOrUnselectAllButtonTapped(_ sender: Any) {
        
    }
    
}

extension FilterVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cameras.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTableViewCell", for: indexPath) as! FilterTableViewCell
        
        
        return  cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
    }
    
}

//extension FilterVC: FilterViewModelDelegate {
//    func showFilter() {
//
//    }
//
//
//}
