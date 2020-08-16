//
//  ShopViewDataSource.swift
//  Clickune
//
//  Created by Олег Романов on 14.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

protocol ShopViewDataSourceDelegate: AnyObject {
    func boostSelected(boost: Boost)
}

class ShopViewDataSourse: NSObject {
    var data: [Boost] = []
    var tableView: UITableView?
    weak var delegate: ShopViewDataSourceDelegate?

    func updateData(_ data: [Boost]) {
        self.data = data
        tableView?.reloadData()
    }

    func setTableView(tableView: UITableView) {
        self.tableView = tableView
        tableView.register(BoostCell.self, forCellReuseIdentifier: "BoostCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ShopViewDataSourse: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "BoostCell",
            for: indexPath
        ) as? BoostCell
        let boost = data[indexPath.row]
        cell?.configure(boost: boost)
        return cell ?? UITableViewCell()
    }
}

extension ShopViewDataSourse: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let boost = data[indexPath.row]
        delegate?.boostSelected(boost: boost)
    }
}
