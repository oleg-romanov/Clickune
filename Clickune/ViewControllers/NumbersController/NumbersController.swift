//
//  NumbersController.swift
//  Clickune
//
//  Created by Олег Романов on 11.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

class NumbersController: UIViewController, UITableViewDataSource {
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        return tableView
    }()

    override func viewDidLoad() {
        view.addSubview(tableView)
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 8
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.item)"
        return cell
    }
}
