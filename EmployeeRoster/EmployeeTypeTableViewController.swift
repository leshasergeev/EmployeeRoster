//
//  EmployeeTypeTableViewController.swift
//  EmployeeRoster
//
//  Created by Алексей Сергеев on 27.04.2021.
//

import UIKit

protocol EmployeeTypeTableViewControllerDelegate {
    func employeeTypeTableViewController(_: EmployeeTypeTableViewController, didSelect employeeType: EmployeeType)
}

class EmployeeTypeTableViewController: UITableViewController {
    
    var employeeType: EmployeeType?
    
    var delegate: EmployeeTypeTableViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EmployeeType.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeType", for: indexPath)
        
        let type = EmployeeType.allCases[indexPath.row]
        cell.textLabel?.text = type.description
        
        cell.accessoryType = employeeType == type ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        employeeType = EmployeeType.allCases[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.employeeTypeTableViewController(self, didSelect: employeeType!)
        tableView.reloadData()
    }
}
