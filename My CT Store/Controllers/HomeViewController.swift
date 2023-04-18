//
//  HomeViewController.swift
//  My CT Store
//
//  Created by Ayush Kakdiya on 31/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    
//MARK: - OUTLET AND VARIABLES
    @IBOutlet weak var tableView: UITableView!
    var viewModel: HomeViewModel = HomeViewModel()
    var arrTableViewCell = [LocationTableViewCell.identifier, CategoriesTableViewCell.identifier, BannerTableViewCell.identifier, DeliveryOptionTableViewCell.identifier,VendorTableViewCell.identifier]
    
//MARK: - APP LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchResponse()
        registerCustemCell()
    }
    
//MARK: - FUNCTIONS
    private func registerCustemCell() {
        tableView.separatorStyle = .none
        arrTableViewCell.forEach { cellName in
            tableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
        }
    }
    
    private func fetchResponse(){
        viewModel.fetchDetalis { result in
            switch result {
            case .success:
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

//MARK: - TABLEVIEW METHODS
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numOfSection()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numOfRowInsection()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        switch indexPath.section {
        case 0:
            let cell: LocationTableViewCell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.identifier) as! LocationTableViewCell
            return cell
        case 1:
            let cell: CategoriesTableViewCell = tableView.dequeueReusableCell(withIdentifier: CategoriesTableViewCell.identifier) as! CategoriesTableViewCell
            cell.delegate = self
            cell.set(arrCategories: viewModel.arrCategories, selectedCategoryIndex: viewModel.selectedCategoryIndex)
            return cell
        case 2:
            let cell: BannerTableViewCell = tableView.dequeueReusableCell(withIdentifier: BannerTableViewCell.identifier) as! BannerTableViewCell
            cell.delegate = self
            cell.set(arrBanner: viewModel.arrBanner)
            return cell
        case 3:
            let cell: DeliveryOptionTableViewCell = tableView.dequeueReusableCell(withIdentifier: DeliveryOptionTableViewCell.identifier) as! DeliveryOptionTableViewCell
            cell.delegate = self
            return cell
        case 4:
            let cell: VendorTableViewCell = tableView.dequeueReusableCell(withIdentifier: VendorTableViewCell.identifier) as! VendorTableViewCell
            cell.set(arrVendors: viewModel.arrVendor)
            return cell
        default:  return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 106
        case 2: return 160
        case 3: return 60
        case 4: return tableView.frame.height
        default: return 44
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0: return 0
        case 1: return 0
        case 2: return 0
        case 3: return 0
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 16))
        return headerView
    }
}
extension HomeViewController: CategoriesTableViewCellDelegate {
    func didSelectCategories(at index: Int){
        viewModel.updateIndex(selectedCategoryIndex: index)
        tableView.reloadData()
        fetchResponse()
    }
}

extension HomeViewController: DeliveryOptionTableViewCellDelegate {
    func didSelectIndexOf(index: Int) {
        viewModel.updateIndexOf(selectedDeliveryIndex: index)
        tableView.reloadData()
        fetchResponse()
    }
}

extension HomeViewController: BannerTableViewCellDelegat {
    func didSelectBanner(at index: Int) {
        print(index)
    }
    
    
}
