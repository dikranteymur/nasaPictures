//
//  FilterViewController.swift
//  NasaPictures
//
//  Created by mdt on 2.12.2021.
//

import UIKit

class FilterVC: UIViewController {

    @IBOutlet weak var cameraNameTableView: UITableView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    var allCamerasName: [String] = []
    
    var viewModel: FilterViewModelProtocol!
    var hasSelectCell: Bool = false
    var filteredList = UserDefaults.filterList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraNameTableView.delegate = self
        cameraNameTableView.dataSource = self
        
        viewModel.delegate = self
        viewModel.load()
        
        print("filterede List: \(filteredList)")
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension FilterVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCamerasName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTableViewCell", for: indexPath) as! FilterTableViewCell
        cell.setCell(name: allCamerasName[indexPath.row])
        
        if filteredList.contains(allCamerasName[indexPath.row]) {
            print(allCamerasName[indexPath.row])
            cell.makeSelect()
            cell.selectStatus = true
        } else {
            cell.makeUnselect()
            cell.selectStatus = false
        }
        return  cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! FilterTableViewCell
        if cell.selectStatus {
            cell.makeUnselect()
            // cikar
            if filteredList.contains(allCamerasName[indexPath.row]) {
                if let index = filteredList.firstIndex(of: allCamerasName[indexPath.row]) {
                    filteredList.remove(at: index)
                    UserDefaults.filterList = filteredList
                }
            }
            
        } else {
            cell.makeSelect()
            // ekle
            if !filteredList.contains(allCamerasName[indexPath.row]) {
                filteredList.append(allCamerasName[indexPath.row])
                UserDefaults.filterList = filteredList
            }
        }
        cell.selectStatus.toggle()
        
        print("Filtered List: \(UserDefaults.filterList)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
}

extension FilterVC: FilterViewModelDelegate {
    func showFilter() {
        
    }
    
    func handleFilter(camerasName: [String]) {
        allCamerasName = camerasName
    }
    
    
}
