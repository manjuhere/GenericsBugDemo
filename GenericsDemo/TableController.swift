//
//  TableController.swift
//  GenericsDemo
//
//  Created by Manjunath Chandrashekar on 26/04/19.
//  Copyright © 2019 manjunath. All rights reserved.
//

import UIKit
// TableController which is Datasource and Dequeues Cell based on generics. 
class TableController<CellType: UITableViewCell>: NSObject, UITableViewDataSource {

    let tableView: UITableView
    // this can be a from Core Data / NSFetchedResulsControllerDelegate
    let data = [
        "Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"
    ]

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        self.tableView.register(CellType.self)
        self.tableView.dataSource = self
    }

    func reload() {
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as CellType
        if let typedCell = cell as? TaskCellBehaviour {
            typedCell.handleTask(modelData: data[indexPath.row], indexPath: indexPath)
        } else {
            assertionFailure("Cell type which doesn't conform to CommonCellBehvaior passed")
        }
        return cell
    }
}
