//
//  Extensions.swift
//  GenericsDemo
//
//  Created by Manjunath Chandrashekar on 26/04/19.
//  Copyright © 2019 manjunath. All rights reserved.
//

import UIKit

// some helper extensions from https://www.dotconferences.com/2019/01/lea-marolt-sonnenschein-making-table-views-great-again

protocol CellReusable {}

extension UITableViewCell : CellReusable {}

extension CellReusable where Self: UITableViewCell {
    static var reuseID: String {
        return String(describing: self)
    }
}

extension UITableView {
    func register<Cell: UITableViewCell>(_ cellClass: Cell.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.reuseID)
    }

    func dequeueReusableCell<Cell: UITableViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withIdentifier: Cell.reuseID, for: indexPath) as? Cell else {
            fatalError("Fatal Error Dequeuing cell - \(String(describing: Cell.self))")
        }
        return cell
    }
}

extension UIView {
    func pinEdgesToSuperView(_ insets: UIEdgeInsets = UIEdgeInsets.zero) {
        guard let superview = self.superview else { return }
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor, constant: insets.left),
            self.topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: insets.top),
            self.trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor, constant: insets.right),
            self.bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: insets.bottom),
            ])
    }
}
