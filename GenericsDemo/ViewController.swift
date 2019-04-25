//
//  ViewController.swift
//  GenericsDemo
//
//  Created by Manjunath Chandrashekar on 26/04/19.
//  Copyright © 2019 manjunath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /// Loads a Calendar view which has different UI requirements on Cell
    @IBAction func cellA() {
        let vc = DetailViewController<CalendarCell>()
        vc.title = "Cell A"
        self.navigationController?.pushViewController(vc, animated: true)
    }

    /// Loads a List view of tasks which has different UI requirements on Cell
    @IBAction func cellB() {
        let vc = DetailViewController<TaskListCell>()
        vc.title = "Cell B"
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


class DetailViewController<CellType: UITableViewCell>: UIViewController {
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    lazy var controller = TableController<CellType>(tableView: self.tableView)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.pinEdgesToSuperView()
        controller.reload()
    }
}
