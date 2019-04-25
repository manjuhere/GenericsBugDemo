//
//  Cells.swift
//  GenericsDemo
//
//  Created by Manjunath Chandrashekar on 26/04/19.
//  Copyright © 2019 manjunath. All rights reserved.
//

import UIKit

/// Behvaiour to be implemented by any cell which deals with task
protocol TaskCellBehaviour: UITableViewCell {
    func handleTask(modelData: Any, indexPath: IndexPath)
}

/// Cell which will be used in calendar view.
/// For the sake of demo its a plan UITableViewCell with style == .value1
class CalendarCell: UITableViewCell, TaskCellBehaviour {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    func handleTask(modelData: Any, indexPath: IndexPath) {
        let title = "\(indexPath.row)"
        let detailText = "\(modelData)"
        self.textLabel?.text = title
        self.detailTextLabel?.text = detailText
    }
}

/// Cell which will be used in a list view.
/// For the sake of demo its a plan UITableViewCell with style == .value2
class TaskListCell: UITableViewCell, TaskCellBehaviour {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value2, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    func handleTask(modelData: Any, indexPath: IndexPath) {
        let title = "\(indexPath.row)"
        let detailText = "\(modelData)"
        self.textLabel?.text = title
        self.detailTextLabel?.text = detailText
    }
}
