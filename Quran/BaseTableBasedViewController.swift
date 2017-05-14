//
//  BaseTableBasedViewController.swift
//  Quran
//
//  Created by Mohamed Afifi on 5/29/16.
//
//  Quran for iOS is a Quran reading application for iOS.
//  Copyright (C) 2017  Quran.com
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//

import UIKit

class BaseTableBasedViewController: BaseViewController, ScrollableToTop {

    weak var tableView: UITableView! // swiftlint:disable:this implicitly_unwrapped_optional

    var clearsSelectionOnViewWillAppear: Bool = true

    lazy var refreshControl: UIRefreshControl = {
        return UIRefreshControl()
    }()

    override func loadView() {
        view = UIView()

        let tableView = UITableView()
        view.addAutoLayoutSubview(tableView)
        view.pinParentAllDirections(tableView)

        self.tableView = tableView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if clearsSelectionOnViewWillAppear {
            if let indexPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: indexPath, animated: animated)
            }
        }
    }

    func scrollToTop() {
        for section in 0..<tableView.numberOfSections {
            if tableView.numberOfRows(inSection: section) > 0 {
                tableView.scrollToRow(at: IndexPath(item: 0, section: section), at: .top, animated: true)
                break
            }
        }
    }
}
