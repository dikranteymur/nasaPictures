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
    var mainModel: MainBuilderModel!
    var filteredList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraNameTableView.delegate = self
        cameraNameTableView.dataSource = self
        filteredList = mainModel.getFilterListFromUserdefault()
        viewModel.delegate = self
        viewModel.load()
        
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        viewModel.sendFiltered(list: filteredList)
        mainModel.setFilterListToUserdefault(list: filteredList)
        
        dismiss(animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true)
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
            // subtract from userdefaults
            if filteredList.contains(allCamerasName[indexPath.row]) {
                if let index = filteredList.firstIndex(of: allCamerasName[indexPath.row]) {
                    filteredList.remove(at: index)
                }
            }
            
        } else {
            cell.makeSelect()
            // add to userdefaults
            if !filteredList.contains(allCamerasName[indexPath.row]) {
                filteredList.append(allCamerasName[indexPath.row])
            }
        }
        cell.selectStatus.toggle()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
}

extension FilterVC: FilterViewModelDelegate {
    
    func handleFilter(camerasName: [String]) {
        allCamerasName = camerasName
    }
    
    
}
